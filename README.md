[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=14253646&assignment_repo_type=AssignmentRepo)
# Template repo for Cloud Programming



**Name:**   Khalid Muzaffar
**Group:** Group 3
**Date:** 25-Apr-2024

## Architecture

This project involves the deployment of a simple TicTacToe game on an AWS EC2 instance using Terraform.

### Components
- **VPC**: Custom Virtual Private Cloud to provide an isolated network environment.
- **Subnets**: Public subnet to host the EC2 instance, enabling external access.
- **Route Tables**: Configurations to define rules and routes to control the traffic flow.
- **Security Groups**: Defined to allow ingress traffic on ports 22 (SSH), 80 (HTTP), and 8080 (HTTP for backend services) and egress traffic to all destinations.
- **EC2 Instance**: AWS EC2 instance running Ubuntu, with Docker installed to containerize the TicTacToe game's frontend and backend.

## Preview

### Configured AWS Services
![image](https://github.com/pwr-cloudprogramming/a5-KhalidMuzaffar269553/assets/149905898/45b821de-14ee-4d5e-bc33-d3d8e8e1ed5d)

![image](https://github.com/pwr-cloudprogramming/a5-KhalidMuzaffar269553/assets/149905898/aa399028-5861-495d-a619-3a12f671e806)


### Application Running
![image](https://github.com/pwr-cloudprogramming/a5-KhalidMuzaffar269553/assets/149905898/6a8132b9-b3d0-4846-93b1-24ba6779e4dc)


## Reflections

### Learning Outcomes
- Gained practical experience with Terraform by defining and managing infrastructure as code.
- Understood the components required to securely deploy an application in AWS.

### Challenges
- Initially faced difficulties with security group settings, which blocked access to the application. Adjusting the ingress rules resolved this issue.
- Installing docker compose in ubuntu and user permissions to perform docker-compose up command.

### Surprises
- The simplicity and power of Terraform were surprising, particularly how some few lines of configuration could create and manage such a complex architecture.

