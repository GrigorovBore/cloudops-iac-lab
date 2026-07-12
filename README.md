# CloudOps IaC Lab

## Project Overview

CloudOps IaC Lab is a beginner-friendly Infrastructure as Code project that demonstrates how AWS infrastructure can be provisioned and managed using Terraform.

The goal of this project is to build a foundational understanding of AWS cloud networking and Infrastructure as Code by provisioning AWS resources with Terraform.

This project focuses on networking and observability and intentionally excludes compute resources to keep the architecture simple and aligned with AWS Cloud Practitioner-level concepts.

Project 1: CloudOps IaC Lab (Networking + Observability).
Potential upgrade to Project 2: Build on this foundation by deploying an application using Amazon EC2 behind an Application Load Balancer (ALB).

---

## Project Scenario

A small business wants to prepare a secure AWS environment where future applications can be deployed.

The business needs:

- A private cloud network
- Controlled access to resources
- Basic monitoring capabilities
- Infrastructure that can be recreated consistently

This project provisions the foundational AWS networking infrastructure that future applications can be deployed into.

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

- Security Groups: Security Groups are intentionally omitted because this project does not deploy compute resources. They would normally be attached to EC2 instances, load balancers, or databases.
- CloudWatch: In this project are used two fundamental CloudWatch resource types - CloudWatch Log Group and CloudWatch Dashboard. CloudWatch Alarm is not included since the VPC has no running workload and does not yet have a meaningful application metric to alarm on.

---

## Architecture Diagram:
```text

                         AWS Account
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  Infrastructure Layer (Networking)                           │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ VPC                                                    │  │
│  │                                                        │  │
│  │  ┌──────────────┐      ┌──────────────┐                │  │
│  │  │ Public       │      │ Private      │                │  │
│  │  │ Subnet       │      │ Subnet       │                │  │
│  │  └──────────────┘      └──────────────┘                │  │
│  │          ▲                    ▲                        │  │
│  │          │                    │                        │  │
│  │  Internet Gateway      Security Groups                │  │
│  │                                                        │  │
│  │        Route Tables control traffic flow              │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│                  │                                           │
│                  │ Monitors                                  │
│                  ▼                                           │
│                                                              │
│          CloudWatch (Monitoring Layer)                       │
│      • Log Groups                                            │
│      • Dashboard                                             │
│                                                              │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```
---

## Cost Management

This project is designed as a low-cost learning environment.

Cost control principles:

- Avoid unnecessary AWS services
- Avoid expensive resources
- Enable AWS Budget alerts
- Destroy resources after testing