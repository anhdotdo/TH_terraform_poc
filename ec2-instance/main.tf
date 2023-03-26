provider "aws" {
  region = var.AWS_REGION
}

resource "aws_instance" "anhdo-ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.anhdo_key.key_name
    security_groups = ["anhdo_sg_using_terraform"]
    tags = {
      "Name" = "anhdo_ec2_jen"
    }
}

resource "aws_instance" "anhdo-ec2-control" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.anhdo_key.key_name
    security_groups = ["anhdo_sg_using_terraform"]
    tags = {
      "Name" = "anhdo_ec2_con"
    }
}

resource "aws_instance" "anhdo-ec2-target" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.anhdo_key.key_name
    security_groups = ["anhdo_sg_using_terraform"]
    tags = {
      "Name" = "anhdo_ec2_tar"
    }
}

resource "aws_security_group" "anhdo_sg_ssh" {
    name = "anhdo_sg_using_terraform"

    #incoming traffic
    ingress {
      cidr_blocks = var.cidr_blocks
      description = "allow ssh traffic"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }
    
    ingress {
        cidr_blocks = var.cidr_blocks
        description = "allow ... traffic"
        from_port = 8080
        protocol = "tcp"
        to_port = 8080
    }
    
    ingress {
        cidr_blocks = var.cidr_blocks
        description = "allow ... traffic"
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }

    #outcoming traffic
    egress {
      cidr_blocks = var.cidr_blocks
      description = "allow ... traffic"
      from_port = 0
      protocol = "-1"
      to_port = 0
    } 
}

resource "aws_subnet" "vietnam_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vietnam_vpc.id
    tags = {
      "Name" = "Main"
    }
}

resource "aws_vpc" "vietnam_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "Vietnam_vpc-test"
    }
}