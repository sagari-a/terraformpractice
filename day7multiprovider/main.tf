
provider "aws" {

# no details entered as aws config is set to ap-south-1
# Hence hydcat2222 bucket will be created in ap-south-1

}

provider "aws" {
  
  region = "us-east-1"
  alias = "murica"

}




resource "aws_s3_bucket" "ap" {
    
    bucket = "hydcat2222"
  
}

resource "aws_s3_bucket" "us" {
  
  bucket = "hydcat4444"
  provider = aws.murica
 
 
}