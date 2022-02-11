

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "EC2-instance-test"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "sa-east-1"
}

variable "aws_cli_profile1" {
  type        = string
  description = "AWS profile Account 1"
  default     = "account1"
}

variable "aws_cli_profile2" {
  type        = string
  description = "AWS profile Account 2"
  default     = "account2"
}


variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}


variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}


variable "bucket_name" {
    default = "bucket-assess-test"
}

variable "s3_backend_bucket_name" {
    default = "s3-state-assess-test"
}



