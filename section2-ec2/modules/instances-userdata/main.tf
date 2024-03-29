resource "aws_instance" "fsimonetti-instance" {
	ami = "${var.sourceami}"
	instance_type = "t2.micro"
	key_name = "${var.keypair}"
	user_data = "${var.userdata}"
    # would be vpc_security_group if not inside default VPC
    security_groups = [ "${var.secgroup}" ]
	tags = {
		Name = "${var.name}"	
	}
}


