# security groups
module "eu-central-1-sg" {
  source = "./modules/secgroups"
  name   = "${var.udemy-sg-name}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-sg" {
  source = "./modules/secgroups"
  name   = "${var.udemy-sg-name}"
  providers = {
    aws = "aws.eu-west-1"
  }
}
# keypairs
module "eu-central-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.udemy-keypair-name}"
  pubkey   = "${var.udemy-pubkey-content}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.udemy-keypair-name}"
  pubkey   = "${var.udemy-pubkey-content}"
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
  userdata = "${var.udemy-userdata-content}"
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