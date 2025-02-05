#----------------- Create a public Subnet-----------------#
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

#----------------- Create a private  Subnet-----------------#
    
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block[1]
  tags = {
    Name = "private_subnet"
  }
}

