resource "aws_s3_bucket" "name" {
    bucket = "hydcat2222"
  
}

resource "aws_dynamodb_table" "name" {
  name = "state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}