# ☁️ CloudTechs Ads Platform — AWS Cloud-Native Deployment
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](#)
[![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform)](#)
[![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?logo=docker)](#)
[![ECS](https://img.shields.io/badge/Amazon%20ECS-Fargate-FF9900?logo=amazon-aws)](#)
[![ECR](https://img.shields.io/badge/Amazon%20ECR-Container%20Registry-FF9900?logo=amazon-aws)](#)
[![Python](https://img.shields.io/badge/Python-FastAPI-3776AB?logo=python)](#)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-RDS-4169E1?logo=postgresql)](#)
[![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=github)](#)
[![Cloudflare](https://img.shields.io/badge/Cloudflare-Edge%20Security-F38020?logo=cloudflare)](#)
[![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana)](#)

> **A production-style AWS cloud engineering project demonstrating Infrastructure as Code, containerization, cloud networking, security, observability, CI/CD, and automated application deployment.**

**Live demonstration:** https://adsplatform.dev

**Repository:** https://github.com/CloudTechs-ai/Ads-Platform

---

# 🚀 Project Overview

CloudTechs Ads Platform is a cloud-native Python/FastAPI application deployed to AWS using **Terraform, Docker, Amazon ECR, Amazon ECS/Fargate, Amazon RDS PostgreSQL, Application Load Balancer, CloudWatch, Grafana, GitHub Actions, and Cloudflare**.

The project demonstrates the complete cloud engineering lifecycle:

```text
Design
   ↓
Provision
   ↓
Secure
   ↓
Containerize
   ↓
Deploy
   ↓
Monitor
   ↓
Troubleshoot
   ↓
Automate
```

Rather than manually creating infrastructure through the AWS Console, the environment is provisioned using **Terraform Infrastructure as Code** and application deployments are automated through **GitHub Actions**.

The repository is designed to be **portable across AWS accounts**. Account-specific infrastructure, credentials, database passwords, domains, and deployment configuration are supplied at deployment time rather than hardcoded into the application.

---

# 🎯 Engineering Goals

This project was built to demonstrate practical experience with:

* ☁️ AWS cloud architecture
* 🏗️ Terraform Infrastructure as Code
* 🐳 Docker containerization
* ⚙️ Amazon ECS/Fargate
* 📦 Amazon ECR
* 🌐 AWS VPC networking
* 🔐 IAM and security groups
* 🗄️ Amazon RDS PostgreSQL
* ⚖️ Application Load Balancing
* 🔒 ACM/TLS/HTTPS
* 🌎 Cloudflare DNS and edge services
* 🔄 GitHub Actions CI/CD
* 📊 CloudWatch logging and monitoring
* 📈 Grafana observability
* 🛠️ Multi-layer infrastructure troubleshooting
* 🚀 Repeatable cloud deployments

---

🏗 Architecture

<img width="1060" height="537" alt="image (5)" src="https://github.com/user-attachments/assets/dbe4fb75-9709-4047-95a9-460abad8afdb" />

## Request Flow

```text
                         Internet
                            │
                            ▼
                     ┌──────────────┐
                     │  Cloudflare  │
                     │ DNS / Edge   │
                     └──────┬───────┘
                            │
                            ▼
                  ┌────────────────────┐
                  │ Application Load   │
                  │ Balancer           │
                  │ HTTP → HTTPS       │
                  └─────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │    AWS ECS          │
                 │     Fargate         │
                 │                     │
                 │  FastAPI Container  │
                 │       :8000         │
                 └─────────┬───────────┘
                           │
                           ▼
                 ┌─────────────────────┐
                 │   Amazon RDS        │
                 │   PostgreSQL        │
                 │     Private         │
                 └─────────────────────┘
```

### Network Security Model

```text
Internet
   │
   ▼
Cloudflare
   │
   ▼
ALB Security Group
   │
   │ TCP 443 / 80
   ▼
ECS Security Group
   │
   │ TCP 8000
   ▼
Fargate Container
   │
   │ TCP 5432
   ▼
RDS Security Group
   │
   ▼
Private PostgreSQL
```

The database is not intended to be directly exposed to the public internet.

---

# 🧰 Technology Stack

## ☁️ Cloud

`AWS` `VPC` `ECS` `Fargate` `ECR` `RDS PostgreSQL` `ALB` `IAM` `CloudWatch` `ACM`

## 🏗 Infrastructure as Code

`Terraform` `HCL` `Infrastructure as Code` `State Management` `Automated Provisioning`

## 🐳 Containers

`Docker` `Docker Compose` `Amazon ECR` `Amazon ECS` `AWS Fargate`

## 🌐 Networking

`VPC` `Public Subnets` `Private Subnets` `Route Tables` `Internet Gateway` `Security Groups` `Load Balancing` `DNS`

## 🔐 Security

`AWS IAM` `Security Groups` `Private Networking` `TLS/HTTPS` `ACM` `Cloudflare` `Secure HTTP Headers`

## 🚀 DevOps / CI/CD

`GitHub Actions` `Automated Builds` `Docker Image Publishing` `ECR` `ECS Deployments`

## 📊 Observability / SRE

`AWS CloudWatch` `Grafana` `Application Logs` `Container Logs` `Metrics` `Health Checks` `Troubleshooting`

## 💻 Application

`Python` `FastAPI` `PostgreSQL` `SQLite` `REST APIs`

---

# ⭐ Key Engineering Features

### Infrastructure as Code

Terraform provisions the AWS environment instead of relying on manual console configuration.

### Containerized Application

The FastAPI application is packaged into a Docker image and stored in Amazon ECR.

### Serverless Containers

Amazon ECS with AWS Fargate runs the application without requiring EC2 container hosts.

### Automated CI/CD

GitHub Actions builds and publishes the application image and updates the ECS deployment.

### Immutable Image Deployment

Application images are tagged using the Git commit SHA rather than relying exclusively on a mutable `latest` tag.

Example:

```text
ads-platform:ba3b0e6095b6a7fbdbc23ebc2c4b207fa9906601
```

This provides traceability between a deployed container and the source commit that produced it.

### HTTPS

AWS Certificate Manager provides the TLS certificate used by the Application Load Balancer.

### Edge Integration

Cloudflare provides DNS and the external edge layer in front of AWS.

### Private Database

RDS PostgreSQL is deployed without direct public accessibility.

---

# 🏗️ Infrastructure as Code — Terraform

Terraform manages the AWS infrastructure required by the platform.

Resources include:

* VPC
* Public subnets
* Private subnets
* Route tables
* Internet Gateway
* Security groups
* IAM roles
* ECS cluster
* ECS service
* Fargate task definition
* ECR repository
* Application Load Balancer
* Target group
* HTTP listener
* HTTPS listener
* ACM certificate
* RDS PostgreSQL
* CloudWatch log group

Terraform provides:

```text
Version Control
      │
      ├── Reproducibility
      ├── Auditability
      ├── Automation
      ├── Consistency
      └── Change Tracking
```

---

# 🌎 Portable AWS Deployment

This project is intentionally designed so that another engineer can deploy the infrastructure into **their own AWS account**.

The repository does not require Ryan's AWS account to function.

Account-specific values are supplied at deployment time.

### Not hardcoded

The project avoids committing:

* AWS access keys
* AWS secret keys
* Database passwords
* Terraform state
* Personal `terraform.tfvars`
* AWS account-specific ECR registry configuration
* Personal Cloudflare credentials
* Personal domain credentials

### Configuration model

```text
GitHub Repository
       │
       ▼
Terraform Configuration
       │
       ├── AWS Region
       ├── Database Password
       └── Domain Name
               │
               ▼
        User's AWS Account
               │
               ▼
       User's AWS Resources
```

This allows the same Terraform codebase to be deployed into different AWS accounts.

---

# 🔐 Configuration

Create a local Terraform variables file from the example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Example:

```hcl
aws_region  = "us-east-1"
db_password = "CHANGE_ME_TO_A_STRONG_PASSWORD"
domain_name = "example.com"
```

### Important

`terraform.tfvars` should **never be committed to Git**.

The repository's `.gitignore` excludes:

```text
terraform.tfvars
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
```

The repository contains:

```text
terraform.tfvars.example
```

as a safe configuration template.

---

# 🔑 GitHub Actions Secrets

The CI/CD workflow requires AWS credentials to deploy the application.

Configure the following GitHub repository secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

These credentials should belong to an AWS IAM principal with only the permissions required by the deployment workflow.

Do **not** commit AWS credentials into the repository.

The ECR registry itself does not need to be hardcoded as a secret. GitHub Actions obtains the registry endpoint from the ECR login action:

```yaml
${{ steps.login-ecr.outputs.registry }}
```

This allows the same workflow to work with different AWS accounts.

---

# 🔄 CI/CD Architecture

Every push to `main` can trigger the deployment workflow.

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Actions
    │
    ├── Checkout
    │
    ├── Configure AWS Credentials
    │
    ├── Authenticate with ECR
    │
    ├── Build Docker Image
    │
    ├── Tag Image with Git SHA
    │
    ├── Push Image to ECR
    │
    ├── Retrieve ECS Task Definition
    │
    ├── Replace Container Image
    │
    ├── Register New Task Definition
    │
    └── Update ECS Service
             │
             ▼
        Amazon ECS
             │
             ▼
         Fargate
             │
             ▼
            ALB
             │
             ▼
       Production App
```

---

# 📦 ECR Image Strategy

The ECR repository is created by Terraform.

The CI/CD pipeline then publishes application images using the Git commit SHA.

Example:

```text
302303422904.dkr.ecr.us-east-1.amazonaws.com/ads-platform:<git-sha>
```

This is preferable to relying solely on:

```text
:latest
```

because each deployed image can be traced back to a specific source revision.

Example:

```text
Git Commit
     │
     ▼
ba3b0e6095b6...
     │
     ▼
Docker Image
     │
     ▼
ECR
     │
     ▼
ECS Task Definition Revision
     │
     ▼
Fargate Deployment
```

---

# 🚀 Deployment Guide

## Prerequisites

Install:

* AWS CLI
* Terraform
* Docker
* Git
* Python
* An AWS account
* A domain if HTTPS/Cloudflare deployment is desired

Verify installations:

```bash
aws --version
terraform version
docker --version
git --version
python --version
```

---

# 1. Clone the Repository

```bash
git clone https://github.com/CloudTechs-ai/Ads-Platform.git
cd Ads-Platform
```

---

# 2. Configure AWS Credentials

Configure the AWS CLI:

```bash
aws configure
```

Verify access:

```bash
aws sts get-caller-identity
```

The command should return the AWS account and IAM identity being used.

---

# 3. Configure Terraform

Navigate to the Terraform directory:

```bash
cd terraform/aws
```

Create the local variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit:

```bash
nano terraform.tfvars
```

or use your preferred editor.

Example:

```hcl
aws_region  = "us-east-1"
db_password = "USE_A_STRONG_UNIQUE_PASSWORD"
domain_name = "example.com"
```

---

# 4. Initialize Terraform

```bash
terraform init
```

---

# 5. Validate the Configuration

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

---

# 6. Review Infrastructure

```bash
terraform plan
```

Review the resources Terraform intends to create.

---

# 7. Provision AWS Infrastructure

```bash
terraform apply
```

Confirm the deployment when prompted.

Terraform will provision the AWS infrastructure including:

```text
VPC
├── Public Subnets
├── Private Subnets
├── Route Tables
├── Internet Gateway
└── Security Groups

ECS
├── Cluster
├── Task Definition
└── Service

ECR
└── Repository

Load Balancing
├── ALB
├── Target Group
├── HTTP Listener
└── HTTPS Listener

Database
└── RDS PostgreSQL

Observability
└── CloudWatch Logs
```

---

# 8. Configure DNS

If using your own domain, point the domain to the AWS Application Load Balancer.

Example Cloudflare record:

```text
Type:   CNAME
Name:   @
Target: <your-alb-dns-name>
```

Example:

```text
adsplatform.dev
        ↓
ads-platform-alb-xxxxxxxx.us-east-1.elb.amazonaws.com
```

For Cloudflare proxying:

```text
Cloudflare
   ↓
AWS ALB
```

The ACM validation record must remain available so AWS Certificate Manager can validate domain ownership.

---

# 9. ACM Certificate Validation

Terraform creates the ACM certificate.

AWS provides a DNS validation CNAME.

Add the provided ACM validation record to your DNS provider.

The validation record should remain present until ACM reports the certificate as:

```text
ISSUED
```

Do not confuse the ACM validation CNAME with the application CNAME.

### Application DNS

```text
adsplatform.dev
      ↓
AWS ALB
```

### ACM validation

```text
_acm-validation-record
      ↓
AWS ACM
```

They serve different purposes.

---

# 10. GitHub Actions Deployment

Once the infrastructure exists:

1. Push the repository to GitHub.
2. Configure:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

3. Push to `main`.

GitHub Actions will:

```text
Build Docker Image
       ↓
Authenticate with ECR
       ↓
Push Image
       ↓
Create New ECS Task Definition Revision
       ↓
Update ECS Service
       ↓
Deploy Fargate Task
```

---

# 🐳 Local Docker Deployment

The application can also be tested locally.

From the application directory containing the Dockerfile:

```bash
docker build -t ads-platform .
```

Run:

```bash
docker run -p 8000:8000 ads-platform
```

Test:

```text
http://localhost:8000
```

The container is configured to listen on:

```text
0.0.0.0:8000
```

---

# ⚙️ ECS/Fargate

The application runs as an ECS service using AWS Fargate.

ECS manages:

* Desired task count
* Task lifecycle
* Container deployment
* Task definitions
* Service scheduling
* Load balancer integration
* Health checks

The deployment model is:

```text
ECS Service
     │
     ▼
Fargate Task
     │
     ▼
FastAPI Container
     │
     ▼
Port 8000
```

---

# ⚖️ Application Load Balancer

The Application Load Balancer provides the external AWS application endpoint.

Configuration includes:

```text
HTTP :80
   │
   └── Redirect → HTTPS :443

HTTPS :443
   │
   ▼
Target Group
   │
   ▼
ECS/Fargate :8000
```

The target group performs health checks against the application.

A healthy ECS task becomes registered with the target group automatically.

---

# 🗄️ Amazon RDS PostgreSQL

The application uses Amazon RDS PostgreSQL for persistent data.

The database is configured as a private resource.

Security-group rules restrict access to approved application traffic.

Conceptually:

```text
Internet
   X
   │
   │ No direct database access
   │
   ▼
ECS/Fargate
   │
   │ TCP 5432
   ▼
RDS PostgreSQL
```

This reduces unnecessary public exposure of the database.

---

# 🔐 Security Architecture

Security is incorporated across multiple layers.

### Identity

* AWS IAM
* IAM execution roles
* GitHub Actions AWS credentials
* Least-privilege design

### Network

* VPC segmentation
* Security groups
* Private database networking
* Restricted application ports

### Transport

* HTTPS
* ACM certificates
* TLS termination at the ALB
* Cloudflare edge integration

### Application

* Environment-based configuration
* Database credentials supplied through configuration
* Secure HTTP headers
* No secrets committed to Git

---

# 📊 Observability

## CloudWatch

ECS container logs are sent to CloudWatch.

Example log group:

```text
/ecs/ads-platform
```

CloudWatch can be used to investigate:

* Application errors
* Container startup failures
* ECS deployment issues
* Runtime behavior
* Operational events

## Grafana

Grafana provides an additional visualization and observability layer for application and infrastructure metrics.

Operational workflow:

```text
Deploy
  ↓
Monitor
  ↓
Detect
  ↓
Investigate
  ↓
Troubleshoot
  ↓
Improve
```

---

# 🛠️ Troubleshooting Guide

One of the primary goals of this project is demonstrating troubleshooting across multiple infrastructure layers.

## Check ECS Service

```bash
aws ecs describe-services \
  --cluster ads-platform-cluster \
  --services ads-platform-service \
  --region us-east-1
```

Look for:

```text
desiredCount
runningCount
pendingCount
events
```

---

## Check ECS Tasks

```bash
aws ecs list-tasks \
  --cluster ads-platform-cluster \
  --service-name ads-platform-service \
  --region us-east-1
```

Then inspect the task:

```bash
aws ecs describe-tasks \
  --cluster ads-platform-cluster \
  --tasks <TASK_ARN> \
  --region us-east-1
```

Check:

```text
lastStatus
desiredStatus
stoppedReason
containers
exitCode
```

---

## Check ECR

```bash
aws ecr describe-images \
  --repository-name ads-platform \
  --region us-east-1
```

Confirm that the expected Git SHA image exists.

---

## Check ALB Target Health

```bash
aws elbv2 describe-target-health \
  --target-group-arn <TARGET_GROUP_ARN> \
  --region us-east-1
```

Expected:

```text
healthy
```

If there are zero targets, investigate the ECS service and running tasks first.

---

## Check CloudWatch Logs

Retrieve the ECS logs through the AWS Console or CLI to identify application/container startup problems.

Common issues include:

* Incorrect environment variables
* Container startup errors
* Missing images
* Database connectivity
* Security-group rules
* Incorrect listener configuration
* ECS task definition errors

---

# 🌐 Cloudflare

Cloudflare provides the external DNS and edge layer.

The intended architecture is:

```text
Client
   ↓
Cloudflare
   ↓
AWS ALB
   ↓
ECS/Fargate
```

Cloudflare can provide:

* DNS
* TLS/SSL
* CDN capabilities
* Caching
* Edge traffic management
* Additional protection

When using Cloudflare with an AWS ALB, ensure the DNS record points to the **current ALB DNS name**.

If Terraform recreates the ALB, its DNS name may change.

---

# 🔄 Infrastructure vs Application Deployment

The project intentionally separates infrastructure provisioning from application deployment.

## Terraform manages infrastructure

```text
Terraform
   ├── VPC
   ├── Networking
   ├── Security Groups
   ├── IAM
   ├── ECR
   ├── ECS
   ├── ALB
   ├── ACM
   ├── RDS
   └── CloudWatch
```

## GitHub Actions manages application delivery

```text
GitHub Actions
   ├── Docker Build
   ├── ECR Push
   ├── Task Definition Revision
   └── ECS Deployment
```

This separation allows infrastructure and application releases to evolve independently.

---

# 🔁 Clone → Configure → Deploy

The intended developer experience is:

```text
1. Clone Repository
        ↓
2. Configure AWS Credentials
        ↓
3. Configure terraform.tfvars
        ↓
4. terraform init
        ↓
5. terraform validate
        ↓
6. terraform plan
        ↓
7. terraform apply
        ↓
8. Configure DNS / ACM
        ↓
9. Configure GitHub Secrets
        ↓
10. Push to main
        ↓
11. GitHub Actions Builds Image
        ↓
12. Image → ECR
        ↓
13. ECS Deployment
        ↓
14. ALB Health Check
        ↓
15. HTTPS Application
```

The repository is designed so that another engineer can perform this workflow using their own AWS account and domain.

---

# 💰 Cost Considerations

This project uses AWS services that can generate charges.

Potential cost sources include:

* Amazon RDS
* ECS/Fargate
* Application Load Balancer
* NAT Gateway, if configured
* ECR storage
* CloudWatch logs
* Data transfer

For experimentation, monitor AWS billing closely.

When the environment is no longer needed:

```bash
terraform destroy
```

Review the Terraform plan carefully before confirming destruction.

---

# 🛡️ Production Considerations

This is a production-style engineering demonstration, but a real enterprise production environment would typically require additional controls.

Examples include:

* AWS WAF
* AWS Secrets Manager
* KMS encryption
* Centralized IAM/SSO
* Remote Terraform state
* State locking
* Multi-AZ architecture
* Automated backups
* Disaster recovery
* Container vulnerability scanning
* Image signing
* Automated security testing
* Blue/green deployments
* Deployment approvals
* Autoscaling
* Centralized SIEM
* Incident response procedures

These represent areas for continued development rather than assumptions that every control is already implemented.

---

# 📈 Future Engineering Enhancements

Potential next-stage improvements include:

* ☸️ Amazon EKS migration
* 🔐 AWS WAF
* 🔑 AWS Secrets Manager
* 🌐 Route 53 integration
* 🔄 Blue/green deployments
* 📦 Reusable Terraform modules
* 🗃️ Terraform remote state
* 📈 ECS Auto Scaling
* 🌎 Multi-region architecture
* 🔥 Disaster recovery automation
* 🛡️ Automated security scanning
* 📊 Prometheus/Grafana observability
* 🔐 Kubernetes NetworkPolicies
* 🌐 AWS Transit Gateway
* 🔗 Site-to-Site VPN
* 🧪 Automated infrastructure testing
* 🛡️ Centralized SIEM integration
* 🔒 OIDC-based GitHub Actions authentication
* 📦 ECR lifecycle policies
* 🧪 Automated application testing
* 🚦 Deployment approval gates

---

# 🧠 Engineering Lessons Demonstrated

This project goes beyond simply provisioning AWS resources.

It demonstrates the ability to reason across multiple infrastructure layers:

```text
Application
     ↓
Container
     ↓
ECS
     ↓
Load Balancer
     ↓
Networking
     ↓
Security Groups
     ↓
DNS
     ↓
Cloudflare
     ↓
Internet
```

Troubleshooting therefore requires understanding how those layers interact.

Examples include:

* Diagnosing ECS task startup failures
* Validating ECR image availability
* Troubleshooting ALB target registration
* Resolving ACM certificate validation
* Debugging DNS records
* Identifying Cloudflare origin errors
* Verifying security-group connectivity
* Tracing application-to-database communication
* Diagnosing CI/CD deployment failures

---

# 💼 What This Project Demonstrates to Employers

This project demonstrates hands-on experience across the modern cloud engineering lifecycle.

| Engineering Area       | Demonstrated Technologies              |
| ---------------------- | -------------------------------------- |
| Cloud                  | AWS                                    |
| Infrastructure as Code | Terraform                              |
| Networking             | VPC, Subnets, Routing, Security Groups |
| Containers             | Docker, ECS, Fargate                   |
| Container Registry     | Amazon ECR                             |
| Databases              | RDS PostgreSQL                         |
| Load Balancing         | Application Load Balancer              |
| Security               | IAM, Security Groups, TLS, ACM         |
| Edge                   | Cloudflare                             |
| CI/CD                  | GitHub Actions                         |
| Observability          | CloudWatch, Grafana                    |
| Application            | Python, FastAPI                        |
| Operations             | Monitoring, Logging, Troubleshooting   |
| Automation             | Terraform + GitHub Actions             |

The project demonstrates:

**Design → Provision → Secure → Containerize → Deploy → Monitor → Troubleshoot → Automate**

---

# 🧑‍💻 Skills Demonstrated

### Cloud Engineering

* AWS architecture
* ECS/Fargate
* ECR
* RDS
* ALB
* CloudWatch
* ACM

### Cloud Networking

* VPC design
* Public/private subnet architecture
* Routing
* Security groups
* Load balancing
* DNS
* Application-to-database connectivity

### Infrastructure Automation

* Terraform
* HCL
* Infrastructure as Code
* Repeatable provisioning
* Configuration management

### DevOps

* Docker
* GitHub Actions
* CI/CD
* Automated image publishing
* Automated ECS deployments

### Operations / SRE

* Logging
* Monitoring
* Health checks
* Deployment troubleshooting
* Container troubleshooting
* Network troubleshooting
* Cloud infrastructure troubleshooting

---

# ☁️ CloudTechs

**CloudTechs — Cloud & DevOps Engineering**

Building practical cloud infrastructure with a focus on:

**AWS • Terraform • Kubernetes • Infrastructure Automation • SRE • Cloud Networking • Platform Engineering**

---

# 📜 License

This project is provided for educational, portfolio, and demonstration purposes.
