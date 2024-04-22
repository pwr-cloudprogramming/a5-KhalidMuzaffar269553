# Jane Doe - Terraform, EC2, TicTacToe report

- Course: *Cloud programming*
- Group: group no.3 
- Date: 22-04-2024

## Environment architecture

This project involves setting up a cloud-based infrastructure to host a Tic Tac Toe web application. The infrastructure is created using Terraform and consists of a Virtual Private Cloud (VPC) with associated resources such as subnets, an internet gateway, and routing tables. The web application is deployed on an AWS EC2 instance which is provisioned with Docker for containerization of the frontend and backend services.

**Key Components:**

- **VPC:** Custom Virtual Private Cloud to securely host our application resources.
- **Security Group:** Configured to allow SSH, HTTP, and custom application port traffic.
- **EC2 Instance:** AWS compute service where the application is hosted, with Docker installed.
- **Docker:** Used for containerization of the application's frontend and backend.
- **Terraform:** IaC tool used to define and provision the AWS infrastructure.

## Preview

Screenshots of configured AWS services. Screenshots of your application running.

![Sample image](img/sample-image.png)

## Reflections

- What did you learn?
Infrastructure as Code (IaC) using Terraform.
AWS cloud services including VPC, EC2, Internet Gateway, and Security Groups.
Containerization with Docker and orchestration using Docker Compose.
Deploying a full-stack web application in a cloud environment.
- What obstacles did you overcome?
Configuring Terraform to correctly provision all the necessary AWS resources.
Managing Docker containers and networking for seamless communication between the frontend and backend.
- What did you help most in overcoming obstacles?
Our previous labs
AWS documentation provided guidance on VPC and EC2 setup.
- Was that something that surprised you?
The ease with which Terraform allows for spinning up an entire cloud-based infrastructure.
