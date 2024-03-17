output "public" {
    value = aws_instance.name.public_ip
      sensitive = true
}
output "private" {
    value = aws_instance.name.private_ip
  sensitive = false
}