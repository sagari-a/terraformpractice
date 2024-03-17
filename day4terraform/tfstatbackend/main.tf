resource "aws_instance" "name" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = "devops"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "Ec2instance"
    }
}