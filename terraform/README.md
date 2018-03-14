# Terraform files for provision of CoreOS instances to AWS

Setup the Terraform configuration file `terraform.tfvars` based on terraform.tfvars.example.

Make sure that accept the required subscription: https://aws.amazon.com/marketplace/fulfillment?productId=0d1e0bd0-eaea-4397-9a3a-c56f861d2a14&ref_=dtl_psb_continue, in "Manual Launch"

Setup:
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"

terraform init
terraform plan
terraform apply
```

Notes:
* Remove the `aws_security_group.ssh`, it's added only for example and test case.
* Configure your provider like you want, based on profiles or adding variables. The direct environment vars are only as example and test.
