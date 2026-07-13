# CloudOps IaC Lab

## Project Overview

CloudOps IaC Lab is a Terraform project that provisions a basic AWS networking environment. It was created as a hands-on learning project to practice Infrastructure as Code and core AWS networking concepts.

I built this project to practice AWS networking and Infrastructure as Code by provisioning resources with Terraform.

To keep the scope manageable, this project provisions only networking and basic CloudWatch resources. Compute resources will be added in a future iteration.

Project 1: CloudOps IaC Lab (Networking + Observability).
Potential upgrade to Project 2: Build on this foundation by deploying an application using Amazon EC2 behind an Application Load Balancer (ALB).

---

## Project Scenario

This project creates a reusable AWS networking foundation that can support future application deployments.

- Create a custom VPC
- Provision public and private subnets
- Configure internet connectivity
- Create CloudWatch resources
- Manage everything with Terraform

This project provisions the foundational AWS networking infrastructure for deploying future applications.

---

## Technologies Used

- Amazon Web Services
- Terraform
- AWS CLI
- GitHub
- GitHub Actions

---

## Architecture

The project provisions the following AWS infrastructure:

```text
AWS Account
│
├── VPC
├── Public Subnet
├── Private Subnet
├── Internet Gateway
├── Public Route Table
├── Route Table Association
├── CloudWatch Log Group
└── CloudWatch Dashboard
```

- Security Groups are not included because this project does not deploy compute resources. They would normally be attached to EC2 instances, load balancers, or databases.
- CloudWatch: This project uses two fundamental CloudWatch resource types: - CloudWatch Log Group and CloudWatch Dashboard. CloudWatch Alarm is not included since the VPC has no running workload and does not yet have a meaningful application metric to alarm on.

---

## Cost Management

This project is designed as a low-cost learning environment.

Cost control principles:

- Avoid unnecessary AWS services
- Avoid expensive resources
- Enable AWS Budget alerts
- Destroy resources after testing