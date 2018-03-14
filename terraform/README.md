# Terraform files for provision of CoreOS instances to AWS

Setup the Terraform configuration file `terraform.tfvars` based on terraform.tfvars.example.

Make sure that accept the required subscription: https://aws.amazon.com/marketplace/fulfillment?productId=0d1e0bd0-eaea-4397-9a3a-c56f861d2a14&ref_=dtl_psb_continue, in "Manual Launch"


This require the Container Linux Config transpiler for generate the cloud-config.yml
https://coreos.com/os/docs/latest/migrating-to-clcs.html
(Example for MacOS)
```
brew install go
```

Add the following exports to your `~/.bash_profile``
```
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

Install Terraform Provider for Container Linux Configs:
https://github.com/coreos/terraform-provider-ct
```
go get -u github.com/coreos/terraform-provider-ct
```

Register the plugin in ~/.terraformrc
```
providers {
  ct = "/$GOPATH/bin/terraform-provider-ct"
}
```

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
