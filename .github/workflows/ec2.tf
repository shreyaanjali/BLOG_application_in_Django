# creation of ec2 with public ip and installed docker using userdata.

terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key = "state/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "my-terraform-lock-table"
        encrypt = true
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
} 
 