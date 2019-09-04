output "fsimonetti-instance_id" {
  value       = "${aws_instance.fsimonetti-instance.id}"
  description = "The EC2 instance ID"
}