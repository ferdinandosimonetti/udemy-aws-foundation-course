output "udemy-secgroup_id" {
  value       = "${aws_security_group.udemy-secgroup-empty.id}"
  description = "The new empty Secgroup ID"
}