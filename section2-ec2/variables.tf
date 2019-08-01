variable "ami-id" {
    # Amazon Linux 2 AMI (HVM), SSD Volume Type
    # region eu-central-1
    description = "base AMI ID to build upon"
    default = "ami-0cc293023f983ed53"
    type = "string"
}
variable "udemy-instance1-central-name" {
    description = "generated instance name (eu-central)"
    type = "string"
}
variable "udemy-instance2-central-name" {
    description = "instance name (eu-central), generated from custom AMI"
    type = "string"
} 
variable "udemy-instance1-west-name" {
    description = "generated instance name (eu-west)"
    type = "string"
} 
variable "udemy-keypair-name" { 
    description = "SSH key(pair) name for instance access"
    type = "string"
}
variable "udemy-sg-name" { 
    description = "Name of the generated Security Group"
    type = "string"
}
variable "udemy-sg-empty-name" {
    description = "Name of the empty SG"
    type = "string"
}
variable "udemy-ami-name" {
    description = "Name of the generated AMI" 
    type = "string"
}
variable "udemy-pubkey-path" {
    description = "user's SSH public key path"
    type = "string"
}
variable "udemy-userdata-path" {
    description = "Path of the customization script"
    type = "string"
}
variable "region" {
    description = "AWS region"
    type = "string"
    default = "eu-central-1"
}
