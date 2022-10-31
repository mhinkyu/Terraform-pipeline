resource "aws_instance" "webserver" {
  ami                    = "ami-0d593311db5abb72b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.lab-subnet-public-1.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  key_name               = "vockey"
  #user_data              = file("user-data.sh")
  tags = {
    Name = "web-server"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key /home/projects/terraform-vpc/labuser.pem -i '${aws_instance.webserver.public_ip},' master.yml"

  }
}