#Task1

provider "aws" {
  
}


resource "aws_iam_role" "test_role" {
 name = "test_role"
 assume_role_policy = jsonencode({

     "Version": "2012-10-17",
     "Statement": [
        {
             "Effect": "Allow",
             "Action": [
                "sts:AssumeRole"
             ],
             "Principal": {
                 "Service": [
                     "ec2.amazonaws.com"
                ]
            }
        }
      ]
    }) 

}


resource "aws_iam_policy_attachment" "dev" {
       
         name = "dev"
   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        roles = [ aws_iam_role.test_role.name ]

}

resource "aws_iam_instance_profile" "test_role" {
    
    name = "test_role"
    role = aws_iam_role.test_role.name
  
}


resource "aws_instance" "task1" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    iam_instance_profile = aws_iam_instance_profile.test_role.name
    tags          = {
             Name = "task1"
        }
  
}

#Task2

resource "aws_instance" "task2" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    iam_instance_profile = "test_role"
    tags          = {
             Name = "task2"
        }
    depends_on = [ aws_instance.task1 ]
}

#Task3

resource "aws_iam_user" "task3_user" {
    name = "task3_user"
    depends_on = [ aws_instance.task2 ]
}

resource "aws_iam_user_policy_attachment" "name" {
  user = aws_iam_user.task3_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  depends_on = [ aws_instance.task2 ]
}