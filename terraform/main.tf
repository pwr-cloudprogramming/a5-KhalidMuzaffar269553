provider "aws" {
  region = "us-east-1"  
}


resource "aws_vpc" "tictactoe_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "TicTacToeVPC"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tictactoe_vpc.id

  tags = {
    Name = "TicTacToeGateway"
  }
}


resource "aws_subnet" "tictactoe_subnet" {
  vpc_id            = aws_vpc.tictactoe_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TicTacToeSubnet"
  }
}


resource "aws_route_table" "tictactoe_rt" {
  vpc_id = aws_vpc.tictactoe_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "TicTacToeRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tictactoe_subnet.id
  route_table_id = aws_route_table.tictactoe_rt.id
}



resource "aws_security_group" "allow_ssh_http" {
name = "allow_ssh_http"
description = "Allow SSH and HTTP inbound traffic and all outbound traffic"
vpc_id = aws_vpc.tictactoe_vpc.id
tags = {
Name = "allow-ssh-http"
}
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1" # all ports
}
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 8080
  to_port = 8081
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 22
  to_port = 22
}


resource "aws_instance" "my_instance" {
  ami                    = "ami-080e1f13689e07408"  
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  associate_public_ip_address = true
  key_name               = "vockey"  

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install -y docker.io docker-compose
    systemctl start docker
    systemctl enable docker
    su - ubuntu 
    cd ~/home/ubuntu/app
    git clone https://github.com/pwr-cloudprogramming/a1-KhalidMuzaffar269553.git 
    sudo docker compose up -d
  EOF

  tags = {
    Name = "MyTicTacInstance"
  }
}
