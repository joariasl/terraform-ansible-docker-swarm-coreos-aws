variable "managers_number" {
  type        = "string"
  description = "Number of manager instances"
  default     = 3
}

variable "manager_instance_type" {
  description = "Manager instance type"
  default     = "t2.micro"
}

resource "aws_instance" "node_manager" {
  ami           = "${var.ami_coreos}"
  instance_type = "${var.manager_instance_type}"
  key_name      = "${aws_key_pair.platform_key.key_name}"
  count         = "${var.managers_number}"

  vpc_security_group_ids = [
    "${aws_security_group.docker_swarm.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "docker-swarm-node-manager-${count.index}"
    Role      = "manager"
    Terraform = "true"
    CoreOS    = "true"
  }
}
