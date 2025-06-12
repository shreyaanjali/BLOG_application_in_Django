# creation of ec2 with public ip and installed docker using userdata.


backend "s3" {
     region = "us-east-1"
     key = "terraform.tfstate"
}

resource "aws_instance" "web" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  key_name                    = "Key_githubaction"
  vpc_security_group_ids      = [aws_security_group.docker_on_ec2.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = "true"

  user_data = file("user_data.sh")
}
 