

resource "aws_instance" "name" {
    ami = data.aws_ami.amazon_linux.id
    key_name = "devops"
    instance_type = "t2.micro"

  subnet_id = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]

  tags = {
    Name = "dev22"
  }
}