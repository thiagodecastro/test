terraform {

 backend "s3" {
   bucket         = "test-s3-state"
   key            = "state/terraform.tfstate"
   region         = "ca-central-1"
  
 }
}
