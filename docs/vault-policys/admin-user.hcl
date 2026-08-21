# Full access everywhere
path "*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Explicit denies override
path "auth/token/create" {
  capabilities = ["deny"]
}

path "sys/policies/*" {
  capabilities = ["deny"]
}
