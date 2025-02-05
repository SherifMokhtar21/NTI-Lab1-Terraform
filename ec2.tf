data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]  # Amazon-owned official AMIs

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Amazon Linux 2
  }
}

resource "aws_instance" "public_instance" {
 ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>Hello from Terraform! , Server IP: $(hostname -I)</h1></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.latest_amazon_linux.id  # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.private_sg.id]

  tags = {
    Name = "private-instance"
  }
}