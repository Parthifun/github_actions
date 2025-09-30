resource "aws_instance" "TV" {
  ami           = "ami-08982f1c5bf93d976"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.Kushi.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.security.id]
  key_name = aws_key_pair.my_key.key_name


  tags = {
    Name = "Channel123"
  }
}





