terraform {

 backend "s3" {
   bucket         = "test-s3-state"
   key            = "state/terraform.tfstate"
   region         = "ca-central-1"
  #  encrypt        = true
  #  kms_key_id     = "alias/terraform-bucket-key"
  #  dynamodb_table = "terraform-state"
 }
}