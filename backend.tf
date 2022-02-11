terraform {

 backend "s3" {
   bucket         = "s3-state-assess-test"
   key            = "state/terraform.tfstate"
   region         = "us-east-1"
  
 }
}
