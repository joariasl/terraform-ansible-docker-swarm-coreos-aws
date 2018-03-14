# Require subscription https://aws.amazon.com/marketplace/fulfillment?productId=0d1e0bd0-eaea-4397-9a3a-c56f861d2a14&ref_=dtl_psb_continue, in "Manual Launch"
variable "ami_coreos" {
  description = "CoreOS AMI"
  default     = "ami-78e96b00"
}

variable "ssh_authorized_key_path" {
  description = "SSH authorized keys"
  default     = "~/.ssh/id_rsa.pub"
}
