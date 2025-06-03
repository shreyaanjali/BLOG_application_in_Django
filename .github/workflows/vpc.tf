# VPC Creation

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        "Name" = "main-vpc"
    }

}

# public subnet

resource "aws_subnet" "public-subnet" {
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"
    vpc_id = aws_vpc.main.id
    availability_zone=  "us-east-1a"
    tags = {
        Name = "public_ec2_instance"
    }
}

