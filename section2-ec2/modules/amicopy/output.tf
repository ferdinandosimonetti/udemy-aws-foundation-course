output "udemy-amiwest_id" {
  value       = "${aws_ami_copy.udemy-amiwest.id}"
  description = "The copied AMI ID"
}