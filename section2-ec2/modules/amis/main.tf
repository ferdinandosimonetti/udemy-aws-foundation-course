resource "aws_ami_from_instance" "udemy-ami" {
  name               = "${var.aminame}"
  source_instance_id = "${var.sourceinstanceid}"
}