variable "workers_number" {
  type        = "string"
  description = "Number of worker instances"
  default     = 5
}

variable "worker_instance_type" {
  description = "Worker instance type"
  default     = "t2.micro"
}

resource "aws_instance" "node_worker" {
  ami           = "${var.ami_coreos}"
  instance_type = "${var.worker_instance_type}"
  key_name      = "${aws_key_pair.platform_key.key_name}"
  count         = "${var.workers_number}"

  vpc_security_group_ids = [
    "${aws_security_group.docker_swarm.id}",
    "${aws_security_group.ssh.id}",
  ]

  tags {
    Name      = "docker-swarm-node-worker-${count.index}"
    Role      = "worker"
    Terraform = "true"
    CoreOS    = "true"
  }

  depends_on = [
    "aws_instance.node_manager",
  ]
}
