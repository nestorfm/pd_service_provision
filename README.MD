# README.md
# PagerDuty Services Terraform Configuration

This Terraform configuration example creates a PagerDuty business service with multiple technical services attached to it.

## Files

- `main.tf` - Main Terraform configuration
- `variables.tf` - Variable definitions
- `outputs.tf` - Output definitions
- `services.tftpl` - Template file for service documentation
- `terraform.tfvars.example` - Example variables file

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
2. Edit `terraform.tfvars` with your PagerDuty token and service configurations

3. Initialize Terraform:
    ```bash
    terraform init
4. Plan the deployment:
    ```bash
    terraform plan
5. Apply the configuration:
    ```bash
    terraform apply
6. Destroy the provisioned changes (optional):
    ```bash
    terraform destroy