output "udemy-ami_id" {
  value       = "${aws_ami_from_instance.udemy-ami.id}"
  description = "The new AMI ID"
}