provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {

    source = "../ec2instance_module" 

      ami_id  	 = "ami-013168dc3850ef002"
      instance   = "t2.micro"
      keyname    = "devops"

    
}
