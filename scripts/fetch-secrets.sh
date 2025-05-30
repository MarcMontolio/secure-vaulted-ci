#!/usr/bin/env bash
set -e

# Assumes VAULT_ADDR and VAULT_TOKEN are already set in the environment

# Fetch credentials from Vault and store them locally
vault kv get -field=username secret/app > creds.username
vault kv get -field=password secret/app > creds.password

# Print them (useful for debugging — remove in production)
echo "Username: $(cat creds.username)"
echo "Password: $(cat creds.password)"
