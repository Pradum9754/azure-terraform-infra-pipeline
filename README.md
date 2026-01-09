# Azure Terraform Infrastructure with DevOps Pipelines

## 🚀 Overview

This repository contains an **end-to-end infrastructure automation framework** using **Terraform** to provision Azure resources, along with **Azure DevOps CI/CD pipelines** that include:

✔ `init`, `plan`, `validate`, `apply` stages  
✔ Manual validations & PR-based protection  
✔ Security scanning tools: `tfsec`, `tflint`, `checkov`  
✔ Cost estimation: `Infracost`  
✔ Modular and reusable Terraform configurations

---

## 📂 What’s Inside

| Folder             | Description                                      |
|-------------------|--------------------------------------------------|
| `modules/`         | Reusable Terraform modules for Azure resources   |
| `environments/`    | Environment-specific configurations (dev, prod)  |
| `pipelines/`       | Azure DevOps YAML pipeline definitions           |
| `scripts/`         | Helper scripts for automation & scans            |
| `docs/`            | Documentation, architecture diagrams             |

---

## 🧱 Technologies Used

- **Terraform** (IaC)
- **Azure DevOps Pipelines**
- **Azure Cloud**
- **Security & Quality Tools**
  - `tfsec` — static security analysis
  - `tflint` — Terraform linter
  - `checkov` — policy-as-code scanning
  - `Infracost` — cost estimation

---

## 💡 Key Features

### ☑ Infrastructure as Code

Automates provisioning of core Azure resources:
- Resource Groups  
- Virtual Networks (VNet + Subnets)
- Network Security Groups (NSGs)
- Virtual Machines (VMs)
- Network Interfaces (NICs)
- Additional modular infrastructure

### 🔄 CI/CD with Azure DevOps

Pipeline workflows:
1. **PR Trigger (Feature Branch)** — runs `init`, `plan`, and security scans  
2. **Manual Approval** — approval gate before apply  
3. **Main Branch Trigger** — runs `apply`  
4. **Post Apply Validation** (optional)

These workflows enable safe, auditable infrastructure changes.

---

## 🧪 Code Scanning & Security

Security and quality scanning integrated as part of CI:

| Tool      | Purpose                                 |
|-----------|-----------------------------------------|
| `tfsec`   | Detect potential cloud security issues  |
| `tflint`  | Enforce Terraform best practices        |
| `checkov` | Policy-based IaC misconfiguration checks|
| `Infracost`| Cost impact visibility                 |

This ensures **secure, compliant, and cost-aware deployments**.

---

## 📦 How to Use

### Prerequisites

Before you begin:
- Azure Subscription  
- Azure DevOps Organization  
- Terraform CLI installed  
- Azure CLI installed  
- Service Principal for Azure authentication

---

### Quick Start

```bash
# Clone the repo
git clone https://github.com/<your-org>/terraform-azure-infra-pipelines.git
cd terraform-azure-infra-pipelines

# Initialize Terraform
terraform init

# Generate a Plan
terraform plan -var-file="environments/dev.tfvars"

# Apply (after approval)
terraform apply -var-file="environments/dev.tfvars"
