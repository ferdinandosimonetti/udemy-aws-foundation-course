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
  pubkey   = "${file("c:\\users\\ferdi\\.ssh\\id_rsa.pub")}"
  providers = {
    aws = "aws.eu-central-1"
  }
}
module "eu-west-1-kp" {
  source = "./modules/keypairs"
  name   = "${var.udemy-keypair-name}"
  pubkey   = "${file("c:\\users\\ferdi\\.ssh\\id_rsa.pub")}"
  providers = {
    aws = "aws.eu-west-1"
  }
}
# instance in eu-central-1
module "eu-central-1-vm" {
  source = "./modules/instances"
  name = "${var.udemy-instance1-central}"
  keypair = "${var.udemy-keypair-name}"
  secgroup = "${var.udemy-sg-name}"
  userdata = "${file(".\\files\\apache.sh")}"
  sourceami = "${var.ami-id}"
  providers = {
    aws = "aws.eu-central-1"
  }
}