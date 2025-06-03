# creation of ec2 with public ip and installed docker using userdata.


resource "aws_instance" "web" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  key_name                    = "Key_githubaction"
  vpc_security_group_ids      = [aws_security_group.docker_on_ec2.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = "true"

    user_data = file("./user_data.sh")
}
  #resource "null_resource" "docker_check" {
  #  depends_on = [aws_instance.web]
  #
  #  provisioner "remote-exec" {
  #     inline = [
  #          "sleep 60",
  #         "docker --version"
  #      ]
#
  #       connection {
  #           type        = "ssh"
  #           user        = "ubuntu"
  #           host        = aws_instance.web.public_ip
  #           private_key = file("../../Key_githubaction.pem")
  #      }
  #  }
#
  #}
#
#