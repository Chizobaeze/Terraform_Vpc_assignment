# AWS VPC ASSIGNMENT USING TERRAFORM



## Background Story
As a aspiring Data engineer,my mentor gave a task to use terraform to create an infrastructure for vpc(virtual private cloud) on aws. the assignment wasn’t just about infrastructure — it was about understanding how modern data systems are built from the ground up. My goal was to create a secure, scalable environment that mimicked a real-world cloud setup. Using Terraform, I defined infrastructure as code, with cidr block, a public subnet, private subnet, routes, internet gateway and a dedicated security group. the setup ensured that public services had internet access, while private components remained protected.


## Architecture Overview
![Image Alt](https://github.com/Chizobaeze/Terraform_Vpc_assignment/blob/28c8ab23b39266a861532320105864a751035af7/vpc_assignment.drawio%20(2).png)

## Network Details
Region: Europe(Frankfurt) (eu-central-1)

CIDR Block: 192.168.0.0/16
Availability Zone: eu-central-1a
Components:
Public subnet (192.168.1.0/24) - For internet-facing resources
Private subnet (192.168.4.0/24) - For protected resources
Internet Gateway - Enables communication with the internet
Security Groups - Controlling inbound/outbound traffic

## How Resources Connect
Users connect to resources in the public subnet of the VPC through the Internet Gateway, which allows access from the internet.
Resources in the public subnet can talk to resources in the private subnet inside the same VPC.

## Infrastructure as Code
The entire architecture is defined using Terraform, ensuring:

Version-controlled infrastructure
Repeatable deployments
Easy modifications and extensions
Documentation through code


## Key Terraform Resources
aws_vpc - Defines the VPCs
aws_subnet - Defines the subnets
aws_internet_gateway - Provides internet access
aws_security_group - Defines security rules
aws_route_table - Controls routing between subnets and the internet


## Getting Started
To deploy this architecture:

Install Terraform
Clone the repository
Configure AWS credentials
Initialize Terraform: terraform init
Plan the deployment: terraform plan
Apply the changes: terraform apply

## Enhancements
Add NAT Gateways to allow private subnet resources to access the internet but because it is an expensive features, we can go without it
Add Elastic ip as well to to ensure stable static public IP addresses for resources like NAT Gateways

