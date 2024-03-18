resource "aws_instance" "name" {
    
    ami = "ami-013168dc3850ef002"
    key_name = "devops"
    instance_type = "t2.micro"
    tags = {
       Name = "dev"    
    }

}

resource "aws_s3_bucket" "name" {
    bucket = "hydcat4444"
    depends_on = [ aws_instance.name ]
    force_destroy = true
}