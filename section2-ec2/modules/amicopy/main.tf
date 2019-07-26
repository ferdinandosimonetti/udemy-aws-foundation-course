resource "aws_ami_copy" "udemy-amiwest" {
  name              = "${var.aminame}"
  source_ami_id     = "${var.sourceami-id}"
  source_ami_region = "${var.sourceami-region}"
}