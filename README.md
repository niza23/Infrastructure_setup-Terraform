
# Terraform AWS Infrastructure Project

This project provisions a complete **AWS infrastructure** using **Terraform**, including:

- **VPC** with public subnets in multiple availability zones
- **Internet Gateway** and public route table
- **Security Groups** for HTTP & SSH
- **EC2 Instances** with user data scripts
- **Application Load Balancer (ALB)** with target groups
- **S3 Bucket**
- **Common tagging strategy**
- **`depends_on`** for explicit dependencies
- **`ignore_changes`** to avoid unwanted updates

---

## 📂 Project Structure
```bash
terraform-aws-project/
│
├── provider.tf # AWS provider configuration
├── variables.tf # Input variables
├── locals.tf # Common tags and constants
├── vpc.tf # VPC, subnets, internet gateway, route tables
├── security.tf # Security groups
├── ec2.tf # EC2 instances
├── s3.tf # S3 bucket
├── alb.tf # Application Load Balancer setup
├── outputs.tf # Output values
├── userdata.sh # User data script for Web Server 1
├── userdata1.sh # User data script for Web Server 2
└── terraform.tfvars # Variable values (not committed to git for security)
```
---

## 🛠 Prerequisites

Before you start, make sure you have:

1. **AWS Account**
2. **AWS CLI** configured with a profile:
   ```bash
   aws configure --profile myprofile 
Terraform installed (v1.3+ recommended)

# How to Use
1️⃣ Clone this repository

```bash
git clone https://github.com/your-repo/terraform-aws-project.git
cd terraform-aws-project

```
2️⃣ Initialize Terraform

```bash
terraform init
```

3️⃣ Validate the configuration

```bash
terraform validate
```

4️⃣ Plan the deployment

```bash
terraform plan -var-file="terraform.tfvars"
```

5️⃣ Apply the configuration

```bash
terraform apply -var-file="terraform.tfvars"
```

6️⃣ Destroy resources when done

```bash
terraform destroy -var-file="terraform.tfvars"
```

# Variables
You can override variables via terraform.tfvars:

```bash
aws_region       = "us-east-1"
aws_profile      = "default"
environment      = "dev"
vpc_cidr         = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
ami_id           = "ami-0261755bbcb8c4a84"
instance_type    = "t2.micro"
bucket_name      = "terraform-demo-bucket-2025"
```

# Features
Modular Structure → Logical separation of Terraform files for easier maintenance

Multi-AZ Deployment → High availability setup with two public subnets

Common Tags → Apply consistent metadata to all resources

Lifecycle Rules → Use of ignore_changes to prevent unnecessary updates

Explicit Dependencies → depends_on to control resource creation order

Outputs → Public IPs, ALB DNS, and S3 bucket name after deployment

# Outputs
After terraform apply, you will see:

ALB DNS Name → Access your application

S3 Bucket Name → For storage

Public IPs of EC2 instances

#Example:

```bash
alb_dns         = terraform-alb-1234567890.us-east-1.elb.amazonaws.com
s3_bucket_name  = terraform-demo-bucket-2025
web1_public_ip  = 54.210.x.x
web2_public_ip  = 3.94.x.x
```
# How It Can Be Improved
### This setup can be extended and improved with:

-Private Subnets & NAT Gateway

Move backend servers or databases to private subnets for better security.

Use a NAT Gateway for outbound internet access from private instances.

-Multi-Environment Setup

Create separate environments (dev, staging, prod) using Terraform workspaces or separate state files.

Parameterize environment-specific variables like instance types, CIDR blocks, and tags.

-Bastion Host / Jump Server

Add a bastion host in the public subnet to SSH into private instances.

-Database Integration

Provision RDS or DynamoDB for application data storage.

- Modules for Reusability

Break down the infrastructure into reusable Terraform modules (VPC module, EC2 module, ALB module, etc.).

-CI/CD Pipeline

Automate terraform plan and terraform apply using GitHub Actions, GitLab CI, or Jenkins.

# Credits
This project was inspired by and follows the Abhishek Veeramalla YouTube Playlist on Terraform AWS infrastructure setup. 
A big thanks to Abhishek for providing clear, practical tutorials!

# Notes
-Ensure userdata1.sh and userdata2.sh are executable and contain valid scripts.

-Do not commit terraform.tfvars to version control if it contains sensitive data.

-S3 bucket names must be globally unique.

# License
This project is licensed under the MIT License.
