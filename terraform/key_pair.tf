resource "aws_key_pair" "platform_key" {
  key_name   = "platform-key"
  public_key = "${file(var.ssh_authorized_key_path)}"
}
