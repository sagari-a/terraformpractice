
provider "aws" {
  
}



# example1: without list variable 

# resource "aws_instance" "name" {

#    ami = "ami-05295b6e6c790593e"
#    instance_type = "t2.micro"
#    count = 2
#    tags = {
   # Name = "webec2"
#     Name = "webec2-${count.index}"
#    }

#}
# If line 17 is commented instead of line 16 before terraform apply we create 2 ec2 instances having 'webec2' Name. However the 2 instances differ by their instance Ids. 

# If line 16 is commented instead of line 17 before terraform apply we create 2 ec2 instances having 'webec2-0' and 'webec2-1' Name respectively.  ${count.index} starts the count from 0.

# Line 10 to 20 is commented so we can go on to example 2.

# Line 30 to 55 is commented so we can go on to example 1. Uncomment line 10 to 20


# example-2 with variables list of string 

variable "ami" {
  type    = string
  default = "ami-05295b6e6c790593e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = [ "dev", "test", "prod"]
}

resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.sandboxes)

  tags = {
    Name = var.sandboxes[count.index]


  }
}