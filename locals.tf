# Common tags for all resources
locals {
  common_tags = {
    Project     = "Terraform-AWS-Infra"
    Owner       = "Nidhi"
    Environment = var.environment
  }
}
