# Terraform Azure Infrastructure

This repository contains Terraform code to build AWS infrastructure for three environments: Development (Dev), Quality Assurance (QA), and Production (Prod). The directory structure is organized as follows:

```
terraform-azure-infrastructure/        
├── .github                    # GitHub Actions confihuration
├── environments/              # Environment-specific configurations
│   ├── dev/
│   │   ├── main.tf            # Main Terraform configuration for Dev environment
│   │   ├── output.tf          # Output configuration for Dev environment
│   │   ├── provider.tf        # Provider configuration for Dev environment
│   │   ├── terraform.tfvars   # Terraform variables for Dev environment
│   │   └── variables.tf       # Variable declarations for Dev environment
│   ├── qa/
│   │   ├── main.tf            # Main Terraform configuration for QA environment
│   │   ├── output.tf          # Output configuration for QA environment
│   │   ├── provider.tf        # Provider configuration for QA environment
│   │   ├── terraform.tfvars   # Terraform variables for QA environment
│   │   └── variables.tf       # Variable declarations for QA environment
│   └── prod/
│       ├── main.tf            # Main Terraform configuration for Prod environment
│       ├── output.tf          # Output configuration for Prod environment
│       ├── provider.tf        # Provider configuration for Prod environment
│       ├── terraform.tfvars   # Terraform variables for Prod environment
│       └── variables.tf       # Variable declarations for Prod environment
└── modules/                    # Terraform modules for AWS services
    ├── ACR/
    ├── AGW/
    ├── CDN/
    ├── ContainerApps/
    ├── KeyPair/
    ├── KeyVault/
    ├── Monitor/
    ├── PostgreSQL/
    ├── PrivateDNS/
    ├── PrivateEndpoint/
    ├── RedisCache/
    ├── SecurityGroup/
    ├── StorageAccounts/
    ├── VirtualMachine/
    ├── VirtualNetwork/
    ├──  Workspace/
```

Each environment folder (`dev`, `qa`, `prod`) contains Terraform configuration files (`main.tf`, `output.tf`, `provider.tf`, `terraform.tfvars`, `variables.tf`) specific to that environment. Similarly, the `modules` directory contains modules for various Azure services, each with its own `main.tf`, `variable.tf`, and `output.tf`.



## Pipeline

The `.github/workflows` directory contains configuration for setting up the GitHub Acctions pipeline for automated infrastructure deployment. Use accrrodingly.

## Run locally

To run the Terraform code on your local PC, you'll need to follow these steps:

### Prerequisites:

1. Install Terraform: Download and install Terraform from the [official website](https://www.terraform.io/downloads.html) for your operating system.

2. Set up Azure credentials: Ensure you have valid AWS credentials configured locally. You can set them up using the Azure CLI or by configuring environment variables (`client_id`,`client_secret`, `tenant_id` and `subscription_id`).


### Steps:

1. Clone the repository: Clone the Terraform AWS Infrastructure repository to your local PC.

    ```bash
    git clone <repository_url>
    ```

2. Navigate to the repository directory:

    ```bash
    cd terraform-azure-infrastructure
    ```

3. Initialize Terraform: Run `terraform init` to initialize the Terraform configuration and download any necessary plugins.

    ```bash
    terraform init
    ```

4. Choose the environment: Navigate to the directory of the environment you want to deploy (e.g., `dev`, `qa`, or `prod`).

    ```bash
    cd environments/dev
    ```

5. Review Terraform plan: Run `terraform plan` to see the execution plan before making any changes. This step is optional but highly recommended.

    ```bash
    terraform plan
    ```

6. Apply Terraform changes: If the plan looks good, apply the changes using `terraform apply`. Terraform will prompt for confirmation before making any modifications to your infrastructure.

    ```bash
    terraform apply
    ```

7. Confirm changes: Review the changes Terraform intends to make and type `yes` when prompted to apply the changes.

8. Wait for completion: Wait for Terraform to provision the infrastructure. This process may take some time depending on the complexity of your configuration.

9. Verify infrastructure: Once Terraform has finished applying the changes, verify that the infrastructure has been deployed correctly by logging in to the AWS Management Console or using the AWS CLI.

10. Clean up (optional): If you want to destroy the infrastructure created by Terraform, run `terraform destroy`. This step will delete all resources managed by Terraform.

    ```bash
    terraform destroy
    ```

11. Confirm destruction: Review the list of resources to be destroyed and type `yes` when prompted to confirm the destruction.

### Notes:

- Ensure that you have appropriate permissions to create and manage AWS resources.
- Always review and validate Terraform plans before applying changes to your infrastructure.
- Make sure to replace placeholder values (such as `<repository_url>` and `<account_id>`) with actual values specific to your environment.
- Monitor the Terraform output for any errors or warnings during the execution process.
- It's recommended to maintain separate state files for each environment to avoid conflicts and maintain isolation.
- Take necessary precautions to secure sensitive information such as AWS credentials and Terraform state files.
## Deployment Pipeline with CircleCI or Github Actions
 

If you want to create a Key-Pair with Terraform, the commit message must contain 'key-pair'. Only then can we download the Key-Pair file from the GitHub Actions artifacts.

Configure OpenID Connect in Azure for Github Actions. Save following values are secret in Github .
 - AZURE_CLIENT_ID
 - AZURE_TENANT_ID
 - AZURE_SUBSCRIPTION_ID

Also in our pipeline we need to Navigate to the repository directory: 
    ``` 
    cd <Respective Environments>
    ```
 
eg;
  ``` 
    cd prod 
  ```

  Also we need to sepcify the branch name here

GitHub Actions
  ```
  on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

  ```
