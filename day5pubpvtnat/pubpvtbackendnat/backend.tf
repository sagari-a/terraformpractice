terraform {
  backend "s3" {
    bucket = "hydcat2222"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "state-lock" 
    encrypt        = true 
  }
}