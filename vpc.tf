#----------------- Create a VPC -----------------#
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block[0]
    tags = {
    Name = var.vpc_name
  }
}
