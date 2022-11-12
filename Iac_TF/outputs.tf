output "PublicIP" {
    value = aws_instance.tomcat_instance.public_ip
}
output "PrivateIP" {
    value = aws_instance.tomcat_instance.private_ip
}

output "Apache_PubIP" {
    value = "https://${aws_instance.tomcat_instance.public_ip}:8080/SampleWebApp/"  
}

output "Apache_PrivateIP" {
    value = "https://${aws_instance.tomcat_instance.private_ip}:8080/SampleWebApp/"  
}
