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
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.web.key_name

  vpc_security_group_ids = [aws_security_group.allow_8080.id]
  user_data              = <<-EOF
                #!/bin/bash
                echo "I made a terraform module" > index.html
                EOF
}
