provider "aws" {
  
}

locals {
  bucket-name = "${var.first}-${var.middle}-bucket"
}

resource "aws_s3_bucket" "demo" {

#   bucket = "${var.first}-${var.middle}-bucket"
    bucket = local.bucket-name
 
  
}