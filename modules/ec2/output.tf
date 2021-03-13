output "public_ip" {
  value = aws_instance.web.public_ip
}

output "tags" {
  value = aws_instance.web.tags
}
