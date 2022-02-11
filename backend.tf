terraform {

 backend "s3" {
   bucket         = "s3-state-assessment-test"
   key            = "state/terraform.tfstate"
   region         = "us-east-1"
  
 }
}
