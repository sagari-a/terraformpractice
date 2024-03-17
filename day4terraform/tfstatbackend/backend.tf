terraform {
  backend "s3" {
    bucket = "hydcat2222"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "state-lock" # DynamoDB table used for state locking, note: first run day-4-statefile-s3
    encrypt        = true  # Ensures the state is encrypted at rest in S3.

  }
}