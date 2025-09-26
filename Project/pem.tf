resource "tls_private_key" "KeyPair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.KeyPair.public_key_openssh
}

resource "local_file" "private_key_file" {
  content          = tls_private_key.KeyPair.private_key_pem
  filename = pathexpand("~/.ssh/P1.pem")
  file_permission  = "0600"
}
