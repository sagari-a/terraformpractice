provider "aws" {
  
}

resource "aws_instance" "x1" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    tags          = {
             Name = "x1"
    }
  
}

resource "aws_instance" "x2" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    tags          = {
             Name = "x2"
    }
  
}