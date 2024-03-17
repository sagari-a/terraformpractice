# Creating Custom VPC

resource "aws_vpc" "custom_vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "custom_vpc"
    }
}

# Creating Custom Internet Gateway

resource "aws_internet_gateway" "custom_ig" {
  vpc_id = aws_vpc.custom_vpc.id
 tags = {
      Name = "custom_ig"
    }
}

# Creating Public Subnet

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.0.0/25"
  vpc_id = aws_vpc.custom_vpc.id
  availability_zone = var.availability_zone
   tags = {
      Name = "public_subnet"
    }
}

# Creating Public Route-table and routing it with IG

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
      Name = "public_RT"
    }
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.custom_ig.id
  }
  }

  # Associating Public RT with the public Subnet

  resource "aws_route_table_association" "public" {
    route_table_id = aws_route_table.public_RT.id
    subnet_id = aws_subnet.public_subnet.id
  }

  # Creating Private Subnet

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.0.128/25"
  vpc_id = aws_vpc.custom_vpc.id
  availability_zone = var.availability_zone
   tags = {
      Name = "private_subnet"
    }
}

  # Creating Elastic IP

  resource "aws_eip" "name" {

  }

  # Creating NAT Gateway

  resource "aws_nat_gateway" "pubNAT" {
    allocation_id = aws_eip.name.id
    subnet_id     = aws_subnet.public_subnet.id
      tags = {
         Name = "pubNAT" 
      }
  }

  # Creating Private Route-table and routing it with NAT
  
  resource "aws_route_table" "private_RT" {
    vpc_id = aws_vpc.custom_vpc.id
    tags = {
      Name = "private_RT"
    }
    route {
          cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.pubNAT.id
  }  
  }

  # Associating Private RT with private subnet

  resource "aws_route_table_association" "private" {
    route_table_id = aws_route_table.private_RT.id
    subnet_id = aws_subnet.private_subnet.id
  }
    
  # Security Grp
resource "aws_security_group" "publicSG" {
    vpc_id      = aws_vpc.custom_vpc.id
  tags = {
    Name = "publicSG"
  }
ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
  }
ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

  # Creating Public Ec2 instance 

  resource "aws_instance" "public" {
    vpc_security_group_ids = [aws_security_group.publicSG.id]
    subnet_id = aws_subnet.public_subnet.id
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "publicEC2"
    }
    associate_public_ip_address = true
  }
 
  # Creating Private Ec2 instance 

  resource "aws_instance" "private" {
    vpc_security_group_ids = [aws_security_group.publicSG.id]
    subnet_id = aws_subnet.private_subnet.id
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.keyname
    tags = {
      Name = "pvt-EC2"
    }
  }