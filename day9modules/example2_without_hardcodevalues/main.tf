provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {

    source = "../ec2instance_module" 

      ami_id  	 = var.ami
      instance   = var.instance_type
      keyname    = var.key_name

    
}