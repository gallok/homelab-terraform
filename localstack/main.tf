resource "aws_s3_bucket" "test" {
  bucket = "mi-bucket-local"
}

resource "aws_security_group" "local-sg" {
  name        = "local-sg"
  description = "Security group localstack"
}

resource "aws_instance" "mi_ec2_local" {
  ami                    = "ami-12345678"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.local-sg.id]
  tags = {
    Name = "EC2-LocalStack"
  }
}

