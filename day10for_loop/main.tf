resource "aws_instance" "web" {
  ami                    = "ami-05295b6e6c790593e"      #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "devops"              #change key name as per your setup
 
  tags = {
    Name = "WEB"
  }
}

resource "aws_security_group" "name" {

  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "customSG"
  }
}