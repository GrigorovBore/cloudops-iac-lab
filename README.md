# CloudOps IaC Lab

## Project Overview

CloudOps IaC Lab is a Terraform project that provisions a basic AWS networking environment. I built it as a hands-on learning project to practice Infrastructure as Code and core AWS networking concepts.

To keep the scope manageable, this project provisions only networking and basic CloudWatch resources. Compute resources will be added in a future iteration.

The next step is to deploy an EC2 application behind an Application Load Balancer using this networking setup.

---

## Project Objectives

This project creates a reusable AWS networking foundation that can support future application deployments.

- Create a custom VPC
- Provision public and private subnets
- Configure internet connectivity
- Create CloudWatch resources
- Manage everything with Terraform

---

## Technologies Used

- Amazon Web Services
- Terraform
- AWS CLI
- GitHub

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
- CloudWatch: This project provisions a CloudWatch Log Group and a CloudWatch Dashboard. A CloudWatch Alarm is not included because there is no running workload or application metric to monitor.

---

## Cost Management

This project is designed as a low-cost learning environment.

To minimize AWS costs:

- Avoid unnecessary AWS services
- Avoid expensive resources
- Enable AWS Budget alerts
- Destroy resources after testing