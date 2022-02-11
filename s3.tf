resource "aws_s3_bucket" "bucket_test" {
    bucket = var.bucket_name 
    
    provider = aws.account2
}

resource "aws_s3_bucket_public_access_block" "block" {
 
 provider = aws.account2
 bucket = aws_s3_bucket.bucket_test.id

 
}