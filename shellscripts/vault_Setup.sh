#!/usr/bin/env bash
#
# vault-bootstrap.sh — initialise, unseal and configure a non-HA Vault on Kubernetes
#
#   ./vault-bootstrap.sh init      # first run: init + unseal + configure
#   ./vault-bootstrap.sh unseal    # after a pod restart
#   ./vault-bootstrap.sh status
#
# DEV USE. Writes unseal keys to local disk in plaintext.
#
set -euo pipefail

NS="${VAULT_NAMESPACE:-vault}"
POD="${VAULT_POD:-vault-0}"
KEY_SHARES="${KEY_SHARES:-5}"
KEY_THRESHOLD="${KEY_THRESHOLD:-3}"
KEYFILE="${KEYFILE:-$HOME/.vault/${NS}-init.json}"

RSA_KEY_NAME="${RSA_KEY_NAME:-app-rsa}"
RSA_KEY_TYPE="${RSA_KEY_TYPE:-rsa-4096}"   # rsa-2048 | rsa-3072 | rsa-4096

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31mxx\033[0m %s\n' "$*" >&2; exit 1; }

v() { kubectl exec -n "$NS" "$POD" -- vault "$@"; }

require_tools() {
  command -v kubectl >/dev/null || die "kubectl not found"
  command -v jq      >/dev/null || die "jq not found"
}

wait_for_pod() {
  log "Waiting for $POD in $NS to be Running"
  # Not using --for=condition=Ready: an uninitialised Vault is Running but never Ready.
  for _ in $(seq 1 60); do
    phase=$(kubectl get pod -n "$NS" "$POD" -o jsonpath='{.status.phase}' 2>/dev/null || true)
    [ "$phase" = "Running" ] && return 0
    sleep 5
  done
  die "$POD did not reach Running state"
}

is_initialised() {
  v status -format=json 2>/dev/null | jq -e '.initialized == true' >/dev/null 2>&1
}

is_sealed() {
  v status -format=json 2>/dev/null | jq -e '.sealed == true' >/dev/null 2>&1
}

do_init() {
  if is_initialised; then
    warn "Vault already initialised — skipping init"
    return 0
  fi

  log "Initialising with $KEY_SHARES shares, threshold $KEY_THRESHOLD"
  mkdir -p "$(dirname "$KEYFILE")"
  ( umask 077
    v operator init \
        -key-shares="$KEY_SHARES" \
        -key-threshold="$KEY_THRESHOLD" \
        -format=json > "$KEYFILE" )
  chmod 600 "$KEYFILE"

  log "Unseal keys and root token written to $KEYFILE"
  warn "This file is the only copy. Lose it and the data is unrecoverable."
}

do_unseal() {
  is_initialised || die "Vault is not initialised — run '$0 init' first"

  if ! is_sealed; then
    log "Vault already unsealed"
    return 0
  fi

  [ -f "$KEYFILE" ] || die "No key file at $KEYFILE"

  log "Unsealing (needs $KEY_THRESHOLD of $KEY_SHARES keys)"
  for i in $(seq 0 $((KEY_THRESHOLD - 1))); do
    key=$(jq -r ".unseal_keys_b64[$i]" "$KEYFILE")
    [ "$key" = "null" ] && die "Key index $i missing from $KEYFILE"
    v operator unseal "$key" >/dev/null
  done

  is_sealed && die "Still sealed after $KEY_THRESHOLD keys"
  log "Unsealed"
}

root_token() { jq -r '.root_token' "$KEYFILE"; }

# Run a vault command authenticated as root, without the token landing in
# the process list of the host or in shell history.
vroot() {
  kubectl exec -n "$NS" "$POD" \
    -e VAULT_TOKEN="$(root_token)" -- vault "$@"
}

configure() {
  log "Enabling KV v2 at secret/"
  vroot secrets enable -path=secret -version=2 kv 2>/dev/null \
    || warn "secret/ already enabled"

  log "Enabling transit engine"
  vroot secrets enable transit 2>/dev/null \
    || warn "transit/ already enabled"

  log "Creating $RSA_KEY_TYPE key '$RSA_KEY_NAME'"
  vroot write -f "transit/keys/${RSA_KEY_NAME}" \
      type="$RSA_KEY_TYPE" \
      exportable=false \
      allow_plaintext_backup=false >/dev/null 2>&1 \
    || warn "key $RSA_KEY_NAME already exists"

  log "Public key:"
  vroot read -format=json "transit/keys/${RSA_KEY_NAME}" \
    | jq -r '.data.keys | to_entries[] | .value.public_key'

  log "Enabling Kubernetes auth"
  vroot auth enable kubernetes 2>/dev/null \
    || warn "kubernetes auth already enabled"

  # Vault 1.9+ in-cluster: leave issuer/CA to the pod's own service account.
  vroot write auth/kubernetes/config \
      kubernetes_host="https://kubernetes.default.svc:443" >/dev/null

  log "Writing example policy 'app-read'"
  kubectl exec -n "$NS" "$POD" -e VAULT_TOKEN="$(root_token)" -i -- \
    vault policy write app-read - <<'EOF'
path "secret/data/app/*" {
  capabilities = ["read", "list"]
}
path "transit/encrypt/app-rsa" {
  capabilities = ["update"]
}
path "transit/decrypt/app-rsa" {
  capabilities = ["update"]
}
EOF

  log "Binding role 'app' to serviceaccount default/app"
  vroot write auth/kubernetes/role/app \
      bound_service_account_names=app \
      bound_service_account_namespaces=default \
      policies=app-read \
      ttl=1h >/dev/null
}

show_status() {
  v status || true
  echo
  [ -f "$KEYFILE" ] && log "Root token: $(root_token)"
}

require_tools
wait_for_pod

case "${1:-init}" in
  init)
    do_init
    do_unseal
    configure
    echo
    log "Done. Root token is in $KEYFILE"
    log "UI/API:  kubectl port-forward -n $NS svc/vault 8200:8200"
    ;;
  unseal) do_unseal ;;
  status) show_status ;;
  *)      die "usage: $0 {init|unseal|status}" ;;
esac