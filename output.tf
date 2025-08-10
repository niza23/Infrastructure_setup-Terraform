output "alb_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.alb.dns_name
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.project_bucket.bucket
}

output "web1_public_ip" {
  value = aws_instance.web1.public_ip
}

output "web2_public_ip" {
  value = aws_instance.web2.public_ip
}
