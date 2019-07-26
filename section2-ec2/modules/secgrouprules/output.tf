output "udemy-secgrouprule_id" {
  value       = "${aws_security_group_rule.udemy-sg-rule.id}"
  description = "The new Secgroup Rule ID"
}