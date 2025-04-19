apiVersion: v1
kind: ConfigMap
metadata:
  name: vault-config
data:
  vault.hcl: |
    storage "postgresql" {
      connection_url = "postgresql://$(VAULT_USER):$(VAULT_PASSWORD)@postgres:5432/vault_db?sslmode=disable"
    }
    listener "tcp" {
      address     = "0.0.0.0:8200"
      tls_disable = 1
    }
    disable_mlock = true
    api_addr = "http://vault:8200"
    cluster_addr = "http://vault:8201"
