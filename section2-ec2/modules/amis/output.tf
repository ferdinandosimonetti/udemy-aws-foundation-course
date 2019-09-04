output "fsimonetti-ami_id" {
  value       = "${aws_ami_from_instance.fsimonetti-ami.id}"
  description = "The new AMI ID"
}