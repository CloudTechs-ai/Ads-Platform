# ☁️ CloudTechs Ads Platform — AWS Cloud-Native Deployment

[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](#) [![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform)](#) [![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?logo=docker)](#) [![ECS](https://img.shields.io/badge/Amazon%20ECS-Fargate-FF9900?logo=amazon-aws)](#) [![Python](https://img.shields.io/badge/Python-FastAPI-3776AB?logo=python)](#) [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-RDS-4169E1?logo=postgresql)](#) [![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=github)](#) [![Cloudflare](https://img.shields.io/badge/Cloudflare-Edge%20Security-F38020?logo=cloudflare)](#) [![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana)](#)

> **A production-style AWS cloud engineering project demonstrating Infrastructure as Code, containerization, cloud networking, security, observability, CI/CD, and scalable application deployment.**

This project deploys a **Python/FastAPI web application to AWS** using **Terraform, Docker, Amazon ECS/Fargate, Amazon RDS PostgreSQL, Application Load Balancer, CloudWatch, Grafana, GitHub Actions, and Cloudflare**.

The environment is designed to demonstrate how a cloud engineer can take an application from **source code → infrastructure → container image → automated deployment → production-style AWS architecture** using repeatable Infrastructure as Code rather than manually configuring resources through the AWS Console.

---

# 🏴 Technology Stack

### ☁️ Cloud

`AWS` `VPC` `ECS` `Fargate` `ECR` `RDS PostgreSQL` `ALB` `IAM` `CloudWatch`

### 🏗 Infrastructure as Code

`Terraform` `HCL` `Infrastructure as Code` `State Management` `Automated Provisioning`

### 🐳 Containers

`Docker` `Docker Compose` `Amazon ECR` `Amazon ECS` `AWS Fargate`

### 🌐 Networking

`VPC` `Public Subnets` `Private Subnets` `Route Tables` `Internet Gateway` `Security Groups` `Load Balancing` `DNS`

### 🔐 Security

`AWS IAM` `Least Privilege` `Security Groups` `Private Networking` `TLS/HTTPS` `Cloudflare` `Secure HTTP Headers`

### 🚀 DevOps / CI/CD

`GitHub Actions` `CI/CD` `Automated Builds` `Docker Image Publishing` `ECR` `ECS Deployments`

### 📊 Observability / SRE

`AWS CloudWatch` `Grafana` `Application Logs` `Container Logs` `Metrics` `Health Checks` `Troubleshooting`

### 💻 Application

`Python` `FastAPI` `PostgreSQL` `SQLite` `REST APIs`

---

# 🎯 Project Highlights

This project demonstrates practical experience with:

* ☁️ **AWS cloud architecture**
* 🏗 **Terraform Infrastructure as Code**
* 🐳 **Docker containerization**
* ⚙️ **Amazon ECS/Fargate**
* 🌐 **AWS VPC networking**
* 🔐 **IAM and network security**
* 🗄️ **Amazon RDS PostgreSQL**
* ⚖️ **Application Load Balancing**
* 📊 **CloudWatch observability**
* 📈 **Grafana monitoring**
* 🔄 **GitHub Actions CI/CD**
* 🌎 **Cloudflare edge integration**
* 🛠️ **Multi-layer cloud troubleshooting**
* 🚀 **Automated infrastructure provisioning**

---

🏗 Architecture

<img width="1060" height="537" alt="image (5)" src="https://github.com/user-attachments/assets/dbe4fb75-9709-4047-95a9-460abad8afdb" />

### Request Flow

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
                  └─────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │    AWS ECS          │
                 │     Fargate         │
                 │                     │
                 │  FastAPI Container  │
                 └─────────┬───────────┘
                           │
                           ▼
                 ┌─────────────────────┐
                 │   Amazon RDS        │
                 │   PostgreSQL        │
                 └─────────────────────┘
```

Terraform provisions the underlying AWS infrastructure and establishes the networking, security, compute, database, load-balancing, and observability components required by the application.

---

# 🏗 Infrastructure as Code — Terraform

The AWS environment is provisioned using **Terraform**.

Instead of manually creating resources through the AWS Console, infrastructure is represented as version-controlled configuration.

Terraform manages resources including:

* VPC
* Public and private subnets
* Route tables
* Internet Gateway
* Security groups
* IAM resources
* ECS clusters
* ECS services
* Fargate tasks
* ECR repositories
* Application Load Balancer
* Target groups
* RDS PostgreSQL
* CloudWatch resources

### Engineering Benefits

```text
Terraform
    │
    ├── Version Controlled
    ├── Reproducible
    ├── Auditable
    ├── Automated
    └── Consistent
```

This makes the environment easier to reproduce, modify, review, and troubleshoot.

---

# ☁️ AWS VPC & Networking

The application runs inside a dedicated **AWS VPC** with network segmentation between internet-facing infrastructure and backend workloads.

The architecture incorporates:

* Public subnets
* Private subnets
* Route tables
* Internet Gateway
* Security groups
* Application-to-database network controls
* Load balancer networking
* Private database connectivity

The design demonstrates core cloud networking concepts including:

**routing → subnet segmentation → security boundaries → application connectivity**

This is particularly relevant to cloud/network engineering roles where application infrastructure and traditional networking intersect.

---

# 🐳 Docker Containerization

The FastAPI application is packaged into a **Docker container**.

Containerization provides:

* Consistent runtime environments
* Portable deployments
* Reproducible builds
* Dependency isolation
* Simplified application delivery

The resulting container image is stored in **Amazon ECR** before being deployed through ECS/Fargate.

```text
Application Source
        │
        ▼
   Docker Build
        │
        ▼
 Container Image
        │
        ▼
   Amazon ECR
        │
        ▼
 Amazon ECS/Fargate
```

---

# ⚙️ Amazon ECS + AWS Fargate

The application is deployed using **Amazon ECS with AWS Fargate**.

Fargate provides serverless container compute, allowing the application to run without manually managing EC2 container hosts.

ECS manages:

* Task definitions
* Container lifecycle
* Service management
* Desired task count
* Health checks
* Deployment orchestration

This architecture demonstrates practical experience deploying containerized workloads using AWS-native orchestration.

---

# ⚖️ Application Load Balancer

An **AWS Application Load Balancer** provides the application entry point within AWS.

The ALB:

* Receives application traffic
* Routes requests to ECS tasks
* Performs health checks
* Provides a stable application endpoint
* Decouples external traffic from individual containers

Traffic is forwarded to the FastAPI application running on port `8000`.

---

# 🗄️ Amazon RDS PostgreSQL

Application data is persisted using **Amazon RDS PostgreSQL**.

The database is designed to remain isolated from direct public access and communicates with the application through controlled AWS networking and security-group rules.

This demonstrates:

* Managed relational database infrastructure
* PostgreSQL deployment on AWS
* Private database networking
* Security-group based access control
* Application-to-database connectivity
* Cloud database architecture

---

# 🔐 Cloud Security

Security is incorporated throughout the architecture.

The project demonstrates:

* AWS IAM
* Least-privilege access principles
* Security groups
* Private database networking
* Network segmentation
* TLS/HTTPS
* Secure HTTP headers
* Environment-based configuration
* Cloudflare edge protection
* Restricted application/database communication

The objective is to reduce unnecessary exposure while maintaining the connectivity required by the application.

---

# 📊 Observability & SRE

The platform incorporates monitoring and operational visibility using **AWS CloudWatch and Grafana**.

### AWS CloudWatch

CloudWatch provides visibility into:

* Application logs
* Container logs
* Infrastructure metrics
* Application behavior
* Operational troubleshooting

### Grafana

Grafana provides an additional visualization layer for monitoring application and infrastructure behavior.

The operational workflow follows a practical SRE model:

```text
Deploy
  │
  ▼
Monitor
  │
  ▼
Detect
  │
  ▼
Troubleshoot
  │
  ▼
Improve
```

---

# 🔄 CI/CD with GitHub Actions

The project uses **GitHub Actions** to automate the application delivery workflow.

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
    ├── Docker Build
    ├── Image Push
    │
    ▼
Amazon ECR
    │
    ▼
Amazon ECS
    │
    ▼
AWS Fargate
    │
    ▼
Application Load Balancer
    │
    ▼
Production Application
```

This creates a repeatable path from source code to deployed infrastructure while reducing unnecessary manual deployment steps.

---

# 🌎 Cloudflare Integration

**Cloudflare** provides the edge layer in front of the AWS environment.

The integration demonstrates:

* DNS
* TLS/SSL
* HTTPS
* Edge traffic management
* CDN capabilities
* Caching
* Additional protection between users and AWS

The resulting architecture separates **edge services from application infrastructure**.

---

# 🛠️ Engineering & Troubleshooting

A major objective of this project is demonstrating the ability to troubleshoot across multiple layers of a cloud environment.

Potential troubleshooting domains include:

### Application Layer

* FastAPI application errors
* API connectivity
* Application ports
* Environment configuration

### Container Layer

* Docker builds
* Container startup failures
* ECS task failures
* Image availability
* Container health checks

### Networking Layer

* VPC routing
* Subnet connectivity
* Security groups
* ALB target connectivity
* Application-to-database communication

### AWS Infrastructure

* IAM permissions
* ECS service configuration
* ECR image deployment
* RDS connectivity
* CloudWatch logs and metrics

This demonstrates a **full-stack infrastructure troubleshooting mindset**, rather than focusing exclusively on a single layer.

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

# 📥 Clone the Repository

```bash
git clone https://github.com/CloudTechs-ai/Ads-Platform.git
cd Ads-Platform/terraform/aws
```

---

# 🏗 Deploy Infrastructure

Initialize Terraform:

```bash
terraform init
```

Review the planned infrastructure:

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

Application:

```text
http://localhost:8000
```

---

# 🌐 Production Architecture

The production-style request path is:

```text
User
 │
 ▼
Cloudflare
 │
 ▼
AWS Application Load Balancer
 │
 ▼
Amazon ECS
 │
 ▼
AWS Fargate
 │
 ▼
FastAPI Application
 │
 ▼
Amazon RDS PostgreSQL
```

---

# 📈 Future Engineering Enhancements

Potential next-stage improvements include:

* ☸️ Amazon EKS migration
* 🔐 AWS WAF
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

---

# 💼 What This Project Demonstrates to Employers

This project is intended to demonstrate hands-on ability across the modern cloud engineering lifecycle:

**Design → Provision → Secure → Containerize → Deploy → Monitor → Troubleshoot → Automate**

Specifically:

| Engineering Area       | Demonstrated Technologies              |
| ---------------------- | -------------------------------------- |
| Cloud                  | AWS                                    |
| Infrastructure as Code | Terraform                              |
| Networking             | VPC, Subnets, Routing, Security Groups |
| Containers             | Docker, ECS, Fargate                   |
| Databases              | RDS PostgreSQL                         |
| Load Balancing         | Application Load Balancer              |
| Security               | IAM, Security Groups, TLS, Cloudflare  |
| CI/CD                  | GitHub Actions                         |
| Observability          | CloudWatch, Grafana                    |
| Application            | Python, FastAPI                        |
| Edge                   | Cloudflare                             |
| Operations             | Monitoring, Logging, Troubleshooting   |

---

# ☁️ CloudTechs

**CloudTechs — Cloud & DevOps Engineering**

Building practical cloud infrastructure with a focus on:

**AWS • Terraform • Kubernetes • Infrastructure Automation • SRE • Cloud Networking • Platform Engineering**

## 📜 License

This project is provided for educational and demonstration purposes.