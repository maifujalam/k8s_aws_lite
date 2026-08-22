path "secrets/*" {
  capabilities = ["read", "list"]
}
path "kubernetes/*" {
  capabilities = ["read", "list"]
}
# prevent escalation
path "auth/token/create" {
  capabilities = ["deny"]
}
path "sys/policies/*" {
  capabilities = ["deny"]
}