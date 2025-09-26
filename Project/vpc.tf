resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Kushi.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "Kushi" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "test" {
  subnet_id = aws_subnet.Kushi.id
}

