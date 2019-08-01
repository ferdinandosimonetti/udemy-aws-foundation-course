output "udemy-instance_id" {
  value       = "${aws_instance.udemy-instance.id}"
  description = "The EC2 instance ID"
}