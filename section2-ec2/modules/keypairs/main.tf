resource "aws_key_pair" "udemy-keypair" {
    key_name   = "${var.name}"
    public_key = "${var.pubkey}"
}
