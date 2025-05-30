# 🧰 Usage Guide

A practical guide for setting up, configuring, and running the **Secure Vaulted CI** pipeline.

---

## 📋 Prerequisites

* Docker installed (locally or on the CI runner)
* Vault CLI installed (for local testing)
* GitHub repository with Actions enabled

---

## 🔧 Configuration Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/MarcMontolio/secure-vaulted-ci.git
   cd secure-vaulted-ci
   ```

2. Define the required GitHub secrets:

   * `VAULT_ADDR`: Vault server address (e.g., `http://127.0.0.1:8200` for local development)
   * `VAULT_TOKEN`: A valid Vault token with access to the necessary secrets

3. Verify that `.gitleaks.toml` is present in the root directory for secret scanning rules.

4. The dummy application lives in `examples/dummy-app/`. It uses Flask and expects secrets mounted to `/run/secrets/username` and `/run/secrets/password`.

---

## ▶️ Local Testing Workflow

1. Launch Vault in development mode:

   ```bash
   vault server -dev -dev-root-token-id=root-token
   ```

   Set environment variables:

   ```bash
   export VAULT_ADDR=http://127.0.0.1:8200
   export VAULT_TOKEN=root-token
   ```

2. Populate Vault with demo secrets:

   ```bash
   vault kv put secret/app username="demo" password="s3cr3t"
   ```

3. Retrieve the secrets:

   ```bash
   ./scripts/fetch-secrets.sh
   ```

4. Build and run the dummy application:

   ```bash
   cd examples/dummy-app
   docker build -t dummy-app:latest .
   docker run --rm -p 8080:8080 \
     --mount type=bind,source=$(pwd)/../../creds.username,target=/run/secrets/username,readonly \
     --mount type=bind,source=$(pwd)/../../creds.password,target=/run/secrets/password,readonly \
     dummy-app:latest
   ```

5. Perform a health check:

   ```bash
   curl http://localhost:8080/health
   ```

---

## 🛠️ GitHub Actions Pipeline

Located at `.github/workflows/secure-vaulted-ci.yml`, the CI pipeline performs the following tasks:

1. Installs the Vault CLI
2. Initializes Vault in dev mode
3. Seeds and retrieves secrets
4. Executes Gitleaks to detect secret leaks
5. Builds the Docker image
6. Scans the image with Trivy
7. Launches the dummy app and verifies its health

The pipeline is configured to fail on any error, helping catch issues early.