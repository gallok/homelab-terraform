output "bucket_name" {
  value = aws_s3_bucket.test.bucket
}

output "ec2_name" {
  value = aws_instance.mi_ec2_local.ami
}

