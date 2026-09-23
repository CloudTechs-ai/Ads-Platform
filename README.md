Ads Platform — AWS Web App Deployment with Terraform + Docker

📌 Overview
This project demonstrates the deployment of a full Ads Platform web application to AWS using Terraform, Docker, AWS CloudWatch, and Cloudflare. It highlights infrastructure automation, containerization, monitoring, and edge performance optimization. A production-style cloud deployment of a Python/FastAPI web application on AWS, designed to demonstrate cloud infrastructure engineering, infrastructure as code, container orchestration, networking, observability, security, and automated deployments.

The project provisions the entire AWS environment with Terraform, packages the application with Docker, deploys containers through Amazon ECS/Fargate, stores application data in Amazon RDS PostgreSQL, and exposes the application through an Application Load Balancer and Cloudflare.

The goal is to demonstrate how a modern cloud engineering team can take an application from source code to a repeatable, secure, observable, and scalable AWS deployment without manually configuring infrastructure through the AWS console.


🏗 Architecture
<img width="1060" height="537" alt="image (5)" src="https://github.com/user-attachments/assets/dbe4fb75-9709-4047-95a9-460abad8afdb" />


# CloudTechs Ads Platform — AWS Cloud-Native Deployment

A production-style cloud deployment of a Python/FastAPI web application on AWS, designed to demonstrate **cloud infrastructure engineering, infrastructure as code, container orchestration, networking, observability, security, and automated deployments**.

The project provisions the entire AWS environment with **Terraform**, packages the application with **Docker**, deploys containers through **Amazon ECS/Fargate**, stores application data in **Amazon RDS PostgreSQL**, and exposes the application through an **Application Load Balancer and Cloudflare**.

The goal is to demonstrate how a modern cloud engineering team can take an application from source code to a repeatable, secure, observable, and scalable AWS deployment without manually configuring infrastructure through the AWS console.

# 🚀 What This Project Demonstrates

This project simulates a real-world application platform rather than simply deploying a web server.

### Infrastructure as Code

The AWS environment is provisioned using **Terraform**, allowing infrastructure to be:

* Version controlled
* Reproducible
* Auditable
* Consistently deployed
* Modified without relying on manual AWS Console configuration

Terraform manages the core infrastructure including:

* VPC
* Subnets
* Route tables
* Internet Gateway
* Security groups
* IAM
* ECS
* Fargate
* Application Load Balancer
* ECR
* RDS
* CloudWatch

---

# ☁️ AWS Architecture

## VPC & Networking

The application is deployed inside a dedicated AWS VPC with segmented networking designed to separate internet-facing infrastructure from application and database workloads.

The architecture uses:

* Public subnets
* Private subnets
* Route tables
* Internet Gateway
* Security groups
* Controlled application-to-database communication

The design demonstrates fundamental AWS networking concepts including routing, subnet isolation, security boundaries, and container-to-database connectivity.

---

## 🐳 Containerization

The FastAPI application is packaged as a Docker container.

Docker provides:

* Consistent application environments
* Portable deployments
* Repeatable builds
* Simplified dependency management
* Isolation between application workloads

Container images are stored in **Amazon ECR** and deployed to ECS/Fargate.

---

# ⚙️ Amazon ECS + Fargate

The application runs on **Amazon ECS using AWS Fargate**, eliminating the need to manage EC2 instances for the container infrastructure.

ECS handles:

* Container scheduling
* Task lifecycle management
* Service management
* Health checks
* Deployment orchestration

Fargate provides the compute layer while AWS manages the underlying infrastructure.

The application can therefore be deployed without manually provisioning or maintaining container hosts.

---

# 🌐 Application Load Balancer

An **Application Load Balancer** provides the entry point for application traffic inside AWS.

The ALB:

* Receives HTTP/HTTPS traffic
* Routes requests to healthy ECS tasks
* Performs target health checks
* Provides a scalable application endpoint
* Separates external traffic from individual containers

Application traffic is forwarded to the FastAPI application running on port `8000`.

---

# 🗄️ Amazon RDS PostgreSQL

Persistent application data is stored in **Amazon RDS PostgreSQL**.

The database is isolated from direct public access and communicates with the application through controlled network paths and security-group rules.

This demonstrates:

* Managed database infrastructure
* Private subnet architecture
* Database security boundaries
* Application-to-database connectivity
* PostgreSQL operations in AWS

---

# 🔐 Security

Security is incorporated throughout the architecture rather than added after deployment.

The project implements:

* AWS IAM
* Security groups
* Private database networking
* Network segmentation
* TLS/HTTPS
* Secure HTTP headers
* Environment-based configuration
* Restricted application/database communication
* Cloudflare edge protection
* Least-privilege access principles

The objective is to minimize unnecessary exposure while maintaining required application connectivity.

---

# 📊 Observability & Reliability

The deployment incorporates observability practices commonly used in production environments.

### AWS CloudWatch

CloudWatch is used for:

* Application logs
* Container logs
* Infrastructure monitoring
* Metrics
* Troubleshooting

### Grafana

Grafana is used to provide additional visibility into application and infrastructure behavior.

The project demonstrates an SRE-oriented approach to operating infrastructure:

**Deploy → Monitor → Detect → Troubleshoot → Improve**

---

# 🔄 CI/CD

The project integrates **GitHub Actions** to automate application deployment workflows.

The pipeline supports:

```text
Developer
   │
   ▼
Git Push / Pull Request
   │
   ▼
GitHub Actions
   │
   ├── Build
   ├── Test
   ├── Docker Image
   ├── Push to Amazon ECR
   │
   ▼
Amazon ECS
   │
   ▼
Fargate Deployment
   │
   ▼
Application Load Balancer
```

This removes unnecessary manual deployment steps and provides a repeatable path from source code to running infrastructure.

---

# 🌎 Cloudflare Integration

Cloudflare sits at the edge of the application and provides:

* DNS
* TLS/SSL
* CDN capabilities
* Edge caching
* Traffic management
* Additional protection between users and the AWS environment

The architecture therefore separates **edge traffic management** from the underlying AWS application infrastructure.

---

# 🧰 Technology Stack

### Cloud

* AWS
* Amazon VPC
* Amazon ECS
* AWS Fargate
* Amazon ECR
* Amazon RDS
* Application Load Balancer
* AWS IAM
* AWS CloudWatch

### Infrastructure

* Terraform
* Infrastructure as Code
* AWS networking
* Security groups
* Subnets
* Route tables
* Internet Gateway

### Containers

* Docker
* Docker Compose
* ECS/Fargate
* Container networking

### Application

* Python
* FastAPI
* PostgreSQL
* SQLite

### DevOps / SRE

* GitHub Actions
* CI/CD
* Automated deployments
* Monitoring
* Observability
* Grafana
* Logging
* Production debugging
* Infrastructure automation

### Edge / Security

* Cloudflare
* DNS
* TLS/SSL
* HTTPS
* Secure HTTP headers

---

# 🎯 Engineering Objectives

This project was designed to demonstrate the following real-world engineering capabilities:

### 1. Infrastructure Automation

Provision an entire AWS environment through Terraform rather than manually configuring resources.

### 2. Cloud Networking

Design VPC networking, subnet segmentation, routing, security boundaries, and application connectivity.

### 3. Containerized Infrastructure

Package and deploy applications using Docker and ECS/Fargate.

### 4. Production Reliability

Implement health checks, monitoring, centralized logging, automated deployments, and observable infrastructure.

### 5. Security

Apply IAM, network segmentation, security groups, TLS, and restricted database access.

### 6. Operational Automation

Use GitHub Actions and Terraform to create repeatable deployment workflows.

### 7. Troubleshooting

Demonstrate the ability to diagnose application, networking, container, and infrastructure issues across multiple layers of the stack.

---

# 🚀 Deployment

## Prerequisites

Install:

* AWS CLI
* Terraform
* Docker
* Git
* Python
* AWS account

Configure AWS credentials:

```bash
aws configure
```

---

## Deploy Infrastructure

Clone the repository:

```bash
git clone https://github.com/CloudTechs-ai/CloudTechs-AI.git
cd CloudTechs-AI
```

Initialize Terraform:

```bash
terraform init
```

Review the infrastructure plan:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

---

# 🐳 Build the Application

Build the Docker image:

```bash
docker build -t ads-platform .
```

Run locally:

```bash
docker run -p 8000:8000 ads-platform
```

The application can then be accessed locally through:

```text
http://localhost:8000
```

---

# 🌐 Application

Live deployment:

**adsplatform.dev**

The production architecture routes users through Cloudflare → AWS Application Load Balancer → ECS/Fargate → RDS PostgreSQL.

---

# 📈 Future Improvements

Potential enhancements include:

* Amazon EKS migration
* Kubernetes network policies
* AWS Transit Gateway
* Site-to-Site VPN
* Multi-region deployment
* AWS WAF
* Route 53 integration
* Auto Scaling policies
* Blue/green deployments
* Disaster recovery automation
* Terraform remote state
* Terraform modules
* Automated security scanning
* Prometheus/Grafana observability
* Centralized SIEM integration
* Automated infrastructure testing

---

# 👨‍💻 CloudTechs

**CloudTechs — Cloud & DevOps Engineering**

Building practical cloud infrastructure with a focus on:

**AWS • Terraform • Kubernetes • Infrastructure Automation • SRE • Cloud Networking • Platform Engineering**

<img width="200" height="200" alt="hashicorp-certified-terraform-associate-004" src="https://github.com/user-attachments/assets/287a120a-dbe0-441a-a54f-9afe063723ed" />

<img width="200" height="200" alt="aws-certified-solutions-architect-associate" src="https://github.com/user-attachments/assets/283c46d6-084e-473b-859f-f8d8a7515ce3" />

<img width="200" height="200" alt="ccna" src="https://github.com/user-attachments/assets/0670cbcc-0b0a-4c1d-9838-8d42ae0a0cb4" />

<img width="200" height="200" alt="comptia-security-ce-certification (2)" src="https://github.com/user-attachments/assets/76bb47c2-925a-4250-a6a3-ae5cf1859012" />

---

## 📜 License

This project is provided for educational and demonstration purposes.



