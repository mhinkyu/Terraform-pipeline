resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "lab-igw"
  }
}

resource "aws_route_table" "lab-public-crt" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.lab-igw.id}"
  }

  tags = {
    Name = "lab-public-crt"
  }

}

resource "aws_route_table_association" "lab-crta-public-subnet-1" {
  subnet_id      = aws_subnet.lab-subnet-public-1.id
  route_table_id = aws_route_table.lab-public-crt.id

}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.lab-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["77.137.68.247/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "ssh-allowed"
  }
}