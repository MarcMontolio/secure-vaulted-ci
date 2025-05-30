<p align="center">
  <img src="https://img.shields.io/github/workflow/status/MarcMontolio/secure-vaulted-ci/Secure%20Vaulted%20CI?label=CI&logo=github" alt="CI">
  <img src="https://img.shields.io/badge/Vault-1.15.4-blue" alt="Vault Version">
  <img src="https://img.shields.io/badge/Docker-Required-lightgrey" alt="Docker Required">
  <img src="https://img.shields.io/github/license/MarcMontolio/secure-vaulted-ci" alt="License">
</p>

# 🔐 Secure Vaulted CI

A GitHub Actions pipeline demonstrating end-to-end Vault integration, secret scanning, vulnerability scanning, and container health checks.

---

## 📋 Table of Contents

* [Prerequisites](#-prerequisites)
* [Quickstart](#-quickstart)
* [Examples](#-examples)
* [Configuration](#-configuration)
* [Docs](#-docs)
* [Contributing](#-contributing)
* [License](#-license)

---

## 📋 Prerequisites

* Docker installed on your machine or GitHub runner
* Vault CLI (for local development or manual testing)
* A GitHub repository with Actions enabled

---

## 🚀 Quickstart

1. **Clone this repository:**

   ```bash
   git clone https://github.com/MarcMontolio/secure-vaulted-ci.git
   cd secure-vaulted-ci
   ```

2. **Set up GitHub Secrets:**

   * `VAULT_ADDR`: URL to your Vault server
   * `VAULT_TOKEN`: Token with access to required secrets

3. **Push to trigger the CI pipeline:**

   ```bash
   git push origin main
   ```

---

## 🔍 Examples

Explore the `examples/dummy-app` folder for a minimal Flask application. It reads secrets from `/run/secrets/username` and `/run/secrets/password`, injected at runtime.

---

## ⚙️ Configuration

* `.gitleaks.toml`: Secret scanning rules for Gitleaks
* `examples/dummy-app/Dockerfile`: Docker image setup (adjust as needed)

---

## 📄 Docs

Detailed usage instructions and setup guide are available in [docs/usage.md](docs/usage.md).

---

## 🤝 Contributing

Contributions are welcome. Please:

1. Fork the repository
2. Create a new branch
3. Submit a pull request with a clear description

---

## 📜 License

MIT © 2025 Marc Montolio
