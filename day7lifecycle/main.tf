provider "aws" {
  
}
resource "aws_instance" "test" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = "devops"
   # availability_zone = "ap-south-1b"
    subnet_id = "subnet-04f194412cfac5674"
    
  tags = {
    Name = "test1a"
  }




#below examples are for lifecycle meta_arguments 

#  lifecycle {
#    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one. Usage :First use the 'terrraform apply' in above code. Renmove # from line 8,20,21,22 and apply # on line 9 and change tags,name = test1b . Then use 'terraform apply' command in terminal. If we just change the tags,name without removing the # from line 8, it will just update the instance and not create and destroy.
#  }

# lifecycle {
#   prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true: . Usage: First use the 'terrraform apply' in above code. Renmove # from line 24,25,26 use 'terraform destroy' command in terminal
# }


#   lifecycle {
#     ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }

}