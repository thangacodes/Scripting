output "web_public_ip" {
  value = aws_instance.web.public_ip
}
output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "public_endpoint" {
  value = "http://${aws_instance.web.public_ip}:80/"
}
output "private_endpoint" {
  value = "http://${aws_instance.web.private_ip}:80/"
}
