output "fsimonetti-secgroup_id" {
  value       = "${aws_security_group.fsimonetti-secgroup-empty.id}"
  description = "The new empty Secgroup ID"
}