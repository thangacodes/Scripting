output "ansible_client_machines_pubip" {
  value = aws_instance.ansible_instance.*.public_ip
}
output "ansible_client_machines_pvtip" {
  value = aws_instance.ansible_instance.*.private_ip
}
