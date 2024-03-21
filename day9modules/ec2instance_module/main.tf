resource "aws_instance" "example" {

  ami          	= var.ami_id
  instance_type = var.instance
     key_name  	= var.keyname
}
