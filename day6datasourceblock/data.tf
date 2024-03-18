data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}
data "aws_security_group" "name" {
    id = "sg-0dcb95043342e21a4"
  
}
data "aws_subnet" "name" {
    id = "subnet-04f194412cfac5674"
  
}
