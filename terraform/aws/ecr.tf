resource "aws_ecr_repository" "app" {
  name                 = "ads-platform"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "ads-platform"
    Environment = "production"
  }
}

output "ecr_repository_url" {
  description = "ECR repository URL for the Ads Platform container"
  value       = aws_ecr_repository.app.repository_url
}