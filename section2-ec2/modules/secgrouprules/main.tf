# create security group for a web server
resource "aws_security_group_rule" "udemy-sg-rule" {
  type              = "${var.type}"
  from_port         = "${var.fromport}"
  to_port           = "${var.toport}"
  protocol          = "${var.protocol}"
  cidr_blocks       = "${var.cidr}" 
  security_group_id = "${var.secgroupid}"
  description       = "${var.description}"
}
