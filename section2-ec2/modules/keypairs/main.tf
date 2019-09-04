resource "aws_key_pair" "fsimonetti-keypair" {
    key_name   = "${var.name}"
    public_key = "${var.pubkey}"
}
