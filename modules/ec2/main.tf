data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}



resource "aws_key_pair" "web" {
  key_name   = "web_1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.size
  key_name               = aws_key_pair.web.key_name
  vpc_security_group_ids = [aws_security_group.allow_traffic.id]

  provisioner "file" {
    source      = "${path.module}/airflow/install.sh"
    destination = "/tmp/install.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_dns
    }
  }

  tags = {
    Name        = "airflow"
    Provisioner = "terraform"
  }

}
