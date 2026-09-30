variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  type = string
}

variable "aws_region" {
  description = "AWS region where the Ads Platform will be deployed"
  type        = string
  default     = "us-east-1"
}