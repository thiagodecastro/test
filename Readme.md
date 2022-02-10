
## Running the Project

To run the projetct you must configure your AWS CLI Profile with proper credentials

To simulate two different accounts you must created two profiles.

So in your `~/.aws/credentials` file you must create 2 profiles, one for each account.

For example:

```
[account1]
aws_access_key_id = foo
aws_secret_access_key = bar

[account2]
aws_access_key_id = foo
aws_secret_access_key = bar

```

In `variables.tf` file you must setup the AWS Region you want to use in `aws_region` variable value

and both `aws_cli_profile1` and `aws_cli_profile2` configured previously.

Ater that, in the last step you should create manualy in your S3 Console,  the S3 bucket that will store the backend state, as proposed in the test guidelines.

The S3 bucket state must have the same name as the `s3_backend_bucket_name` variable

Thats it. After this steps you should be able to run `terraform init` and `terraform apply` to provise the resources and test the connectivity.
