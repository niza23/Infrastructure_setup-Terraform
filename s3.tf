resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  lifecycle {
    ignore_changes = [tags]
  }

  tags = merge(local.common_tags, { Name = "Terraform-Project-Bucket" })
}
