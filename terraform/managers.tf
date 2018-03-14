variable "managers_number" {
  type        = "string"
  description = "Number of manager instances"
  default     = 3
}

variable "manager_instance_type" {
  description = "Manager instance type"
  default     = "t2.micro"
}

variable "discovery_etcd_token" {
  # Generate a new token for each unique cluster from https://discovery.etcd.io/new?size=3
  # specify the initial size of your cluster with ?size=X
  type = "string"

  description = "CoreOS discovery etcd token"
}

data "template_file" "container_linux_config" {
  template = "${file("${path.module}/container-linux-config.yml.tpl")}"

  vars {
    DISCOVERY_ETCD_TOKEN = "${var.discovery_etcd_token}"
  }
}

data "ct_config" "ignition_config" {
  content      = "${data.template_file.container_linux_config.rendered}"
  platform     = "ec2"
  pretty_print = false
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

  user_data = "${data.ct_config.ignition_config.rendered}"

  tags {
    Name      = "docker-swarm-node-manager-${count.index}"
    Role      = "manager"
    Terraform = "true"
    CoreOS    = "true"
  }
}
