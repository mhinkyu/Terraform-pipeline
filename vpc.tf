resource "aws_vpc" "lab-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"

  tags = {
    Name = "lab-vpc"
  }
}

resource "aws_subnet" "lab-subnet-public-1" {
  vpc_id                  = aws_vpc.lab-vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"

  tags = {
    Name = "lab-subnet-public-1"
    }

}

resource "aws_subnet" "lab-subnet-public-2" {
  vpc_id                  = aws_vpc.lab-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2b"

  tags = {
    Name = "lab-subnet-public-2"
  }

}

resource "aws_subnet" "lab-subnet-private-1" {
  vpc_id            = aws_vpc.lab-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "lab-subnet-private-1"
    }

}

resource "aws_subnet" "lab-subnet-private-2" {
  vpc_id            = aws_vpc.lab-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "lab-subnet-private-2"
    }

}