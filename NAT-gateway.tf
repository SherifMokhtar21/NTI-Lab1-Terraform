
# Create a NAT Gateway in each availability zone

resource "aws_nat_gateway" "NAT" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.nat_eip.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}


# Create an Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {
  associate_with_private_ip = true
}
