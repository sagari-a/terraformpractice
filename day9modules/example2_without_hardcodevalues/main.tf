provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {

    source = "../ec2instance_module" 

      ami_id  	 = var.ami              # ami_id is linked to the variable amid_id in the main.tf of the ec2instance_module folder and get its value from var.ami in the variables.tf in this folder
      instance   = var.instance_type    # instance is linked to the variable instance in the main.tf of the ec2instance_module folder and get its value from var.instance_type in the variables.tf in this folder
      keyname    = var.key_name         # keyname is linked to the variable keyname in the main.tf of the ec2instance_module folder and get its value from var.key_name in the variables.tf in this folder  

    
}