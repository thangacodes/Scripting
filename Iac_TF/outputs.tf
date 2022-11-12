output "PublicIP" {
    value = aws_instance.tomcat_instance.public_ip
}
output "PrivateIP" {
    value = aws_instance.tomcat_instance.private_ip
}

output "Apache_Pub_Endpoint" {
    value = "http://${aws_instance.tomcat_instance.public_ip}:8080/SampleWebApp/"  
}

output "Apache_Pvt_Endpoint" {
    value = "http://${aws_instance.tomcat_instance.private_ip}:8080/SampleWebApp/"  
}
