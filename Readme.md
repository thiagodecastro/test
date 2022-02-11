
# Assessment Test

This project implementats the assessment test described [here](https://docs.google.com/forms/d/e/1FAIpQLSdCO2hxz2gEkgQub4m-jxmAlFJU2JzKNiHOXsw47b09Lzrufg/viewform)


## Reference
Test:

Deliver a Terraform project to a repository of your choice (preferably public projects on GitHub or GitLab) to provision the following AWS infrastructure:

        Account 2

        - Provision an S3 bucket in Region B

        ====================================

        Account 1

        - Provision a custom VPC with a private subnet


        - Provision an EC2 instance in the private subnet with direct access to the S3 bucket provisioned in Account 2 (Step 1.a.i)


## Setup

Before running the project it's necessary a previous setup as described in theses 3 Steps configuration bellow:

### Step 1:

Setting up your AWS CLI profile with the proper credentials:


In  `~/.aws/credentials` file you must create 2 profiles, one for each account.

For example:

```
[account1]
aws_access_key_id = foo
aws_secret_access_key = bar

[account2]
aws_access_key_id = foo
aws_secret_access_key = bar

```

### Step 2

Variables:

In the `variables.tf` file you must configure the AWS Region that will be used. 
Fill `aws_region` variable value with the Region Name.

In `aws_cli_profile1` and `aws_cli_profile2` variables, fill with the profile names configured earlier.

### Step 3
S3 Backend:

After that, in the last step you must create the S3 bucket that will store the backend state as proposed in the testing guidelines.

The S3 bucket state must have the same name as the `s3_backend_bucket_name` variable value.

## Running the project

That's it. 

After following these steps, you will be able to run `terraform init` and `terraform apply` to provision the resources and test services and connectivity.