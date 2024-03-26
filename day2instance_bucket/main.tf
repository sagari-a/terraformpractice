provider "aws" {
  
}

resource "aws_s3_bucket" "name" {

    bucket = "hydcat2222"
   
  
}

resource "aws_instance" "name" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    tags          = {
             Name = "test_ec2"
    }
  
}