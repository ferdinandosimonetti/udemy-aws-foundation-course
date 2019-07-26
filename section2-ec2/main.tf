# security groups
module "eu-central-1-sg" {
  source = "./modules/secgroups-web"
  name   = "${var.udemy-sg-name}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-sg" {
  source = "./modules/secgroups-web"
  name   = "${var.udemy-sg-name}"
  providers = {
    aws = "aws.eu-west-1"
  }
}

# keypairs
module "eu-central-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.udemy-keypair-name}"
  pubkey   = "${file(var.udemy-pubkey-path)}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.udemy-keypair-name}"
  pubkey   = "${file(var.udemy-pubkey-path)}"
  providers = {
    aws = "aws.eu-west-1"
  }
}

# instance in eu-central-1
module "eu-central-1-vm" {
  source = "./modules/instances"
  name = "${var.udemy-instance1-central-name}"
  keypair = "${var.udemy-keypair-name}"
  secgroup = "${var.udemy-sg-name}"
  userdata = "${file(var.udemy-userdata-path)}"
  sourceami = "${var.ami-id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}

# AMI from instance
module "eu-central-1-ami" {
  source = "./modules/amis"
  aminame = "${var.udemy-ami-name}"
  sourceinstanceid = "${module.eu-central-1-vm.udemy-instance_id}"
  providers = {
    aws = "aws.eu-central-1"
  }  
}

# second instance in eu-central-1, this time from custom AMI
module "eu-central-1-vm2" {
  source = "./modules/instances"
  name = "${var.udemy-instance2-central-name}"
  keypair = "${var.udemy-keypair-name}"
  secgroup = "${var.udemy-sg-name}"
  sourceami = "${module.eu-central-1-ami.udemy-ami_id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}

# AMI on west, from custom AMI
module "eu-west-1-ami" {
  source = "./modules/amicopy"
  aminame = "${var.udemy-ami-name}"
  sourceami-id = "${module.eu-central-1-ami.udemy-ami_id}"
  sourceami-region = "${var.region}"
  providers = {
    aws = "aws.eu-west-1"
  }  
}

# first instance in eu-west-1, from copied AMI
module "eu-west-1-vm" {
  source = "./modules/instances"
  name = "${var.udemy-instance1-west-name}"
  keypair = "${var.udemy-keypair-name}"
  secgroup = "${var.udemy-sg-name}"
  sourceami = "${module.eu-west-1-ami.udemy-amiwest_id}"
  providers = {
    aws = "aws.eu-west-1"
  }
}