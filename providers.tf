provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_cli_profile1
  alias                   = "account1"
}

provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_cli_profile2
  alias                   = "account2"
}
