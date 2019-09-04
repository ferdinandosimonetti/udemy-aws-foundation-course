# security groups
module "eu-central-1-sg-webserver" {
  source = "./modules/secgroups"
  name   = "${var.fsimonetti-sg-name}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-sg-webserver" {
  source = "./modules/secgroups"
  name   = "${var.fsimonetti-sg-name}"
  providers = {
    aws = "aws.eu-west-1"
  }
}

# security group rules - eu-central-1
# add egress 'allow-all' rule to SG
module "eu-central-1-sg-rule-egress" {
  source = "./modules/secgrouprules"
  description = "Egress allow all"
  type = "egress"
  fromport = 0
  toport = 0
  protocol = -1
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-central-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
# add ingress rules to SG
module "eu-central-1-sg-rule-ingress-ssh" {
  source = "./modules/secgrouprules"
  description = "Ingress SSH"
  type = "ingress"
  fromport = 22
  toport = 22
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-central-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-central-1-sg-rule-ingress-http" {
  source = "./modules/secgrouprules"
  description = "Ingress HTTP"
  type = "ingress"
  fromport = 80
  toport = 80
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-central-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-central-1-sg-rule-ingress-https" {
  source = "./modules/secgrouprules"
  description = "Ingress HTTPS"
  type = "ingress"
  fromport = 443
  toport = 443
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-central-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}

# security group rules - eu-west-1
# add egress 'allow-all' rule to SG
module "eu-west-1-sg-rule-egress" {
  source = "./modules/secgrouprules"
  description = "Egress allow all"
  type = "egress"
  fromport = 0
  toport = 0
  protocol = -1
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-west-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}
# add ingress rules to SG
module "eu-west-1-sg-rule-ingress-ssh" {
  source = "./modules/secgrouprules"
  description = "Ingress SSH"
  type = "ingress"
  fromport = 22
  toport = 22
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-west-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}
module "eu-west-1-sg-rule-ingress-http" {
  source = "./modules/secgrouprules"
  description = "Ingress HTTP"
  type = "ingress"
  fromport = 80
  toport = 80
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-west-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}
module "eu-west-1-sg-rule-ingress-https" {
  source = "./modules/secgrouprules"
  description = "Ingress HTTPS"
  type = "ingress"
  fromport = 443
  toport = 443
  protocol = "tcp"
  cidr = [ "0.0.0.0/0" ]
  secgroupid = "${module.eu-west-1-sg-webserver.fsimonetti-secgroup_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}

# keypairs
module "eu-central-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.fsimonetti-keypair-name}"
  pubkey   = "${file(var.fsimonetti-pubkey-path)}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.fsimonetti-keypair-name}"
  pubkey   = "${file(var.fsimonetti-pubkey-path)}"
  providers = {
    aws = "aws.eu-west-1"
  }
}

# instance in eu-central-1
module "eu-central-1-vm" {
  source = "./modules/instances-userdata"
  name = "${var.fsimonetti-instance1-central-name}"
  keypair = "${var.fsimonetti-keypair-name}"
  secgroup = "${var.fsimonetti-sg-name}"
  userdata = "${file(var.fsimonetti-userdata-path)}"
  sourceami = "${var.ami-id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}

# AMI from instance
module "eu-central-1-ami" {
  source = "./modules/amis"
  aminame = "${var.fsimonetti-ami-name}"
  sourceinstanceid = "${module.eu-central-1-vm.fsimonetti-instance_id}"
  providers = {
    aws = "aws.eu-central-1"
  }  
}

# second instance in eu-central-1, this time from custom AMI
module "eu-central-1-vm2" {
  source = "./modules/instances"
  name = "${var.fsimonetti-instance2-central-name}"
  keypair = "${var.fsimonetti-keypair-name}"
  secgroup = "${var.fsimonetti-sg-name}"
  sourceami = "${module.eu-central-1-ami.fsimonetti-ami_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}

# AMI on west, from custom AMI
module "eu-west-1-ami" {
  source = "./modules/amicopy"
  aminame = "${var.fsimonetti-ami-name}"
  sourceami-id = "${module.eu-central-1-ami.fsimonetti-ami_id}"
  sourceami-region = "${var.region}"
  providers = {
    aws = "aws.eu-west-1"
  }  
}

# first instance in eu-west-1, from copied AMI
module "eu-west-1-vm" {
  source = "./modules/instances"
  name = "${var.fsimonetti-instance1-west-name}"
  keypair = "${var.fsimonetti-keypair-name}"
  secgroup = "${var.fsimonetti-sg-name}"
  sourceami = "${module.eu-west-1-ami.fsimonetti-amiwest_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}