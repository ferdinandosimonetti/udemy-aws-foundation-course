resource "aws_security_group" "fsimonetti-secgroup-empty" {
  name        = "${var.name}"
  description = "Empty SG to be filled via aws_security_group_rule resource"
  tags = {
    Name = "${var.name}"
  }
}