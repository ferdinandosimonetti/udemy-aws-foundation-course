variable "ami-id" {
    # Amazon Linux 2 AMI (HVM), SSD Volume Type
    default = "ami-0cc293023f983ed53"
    type = "string"
}

variable "udemy-instance1-central" {
    default = "udemy-webserver1"
    type = "string"
} 
variable "udemy-instance1-west" {
    default = "udemy-webserver2"
    type = "string"
} 
variable "udemy-keypair-name" { 
    default = "aws-foundation-private-key"
    type = "string"
}
variable "udemy-sg-name" { 
    default = "udemy-webserver"
    type = "string"
}
variable "udemy-ami-name" { 
    default = "udemy-webserver-ami"
    type = "string"
}