provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {

    source = "../ec2instance_module" 

      ami_id  	 = "ami-013168dc3850ef002"   # ami_id is linked to the variable amid_id in the main.tf of the ec2instance_module folder
      instance   = "t2.micro"                # instance is linked to the variable instance in the main.tf of the ec2instance_module folder
      keyname    = "devops"                  # keyname is linked to the variable keyname in the main.tf of the ec2instance_module folder

    
}
