provider "aws" {
    
}


resource "aws_instance" "name" {
  ami                    = "ami-013168dc3850ef002"      #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "devops"              #change key name as per your setup
  user_data              = file("test.sh") # define your path and file name 
  security_groups = [ "launch-wizard-2" ] 
  tags = {
    Name = "Web"
  }
}