resource "aws_security_group" "allow_8080" {
  name        = "allow_8080"
  description = "Allow 8080 inbound traffic"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "8080 from VPC"
    from_port   = 8080
    protocol    = "tcp"
    self        = false
    to_port     = 8080
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Enabled SSH access from anywhere"
  }

  // Allow access to INTERNET
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
