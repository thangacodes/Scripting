resource "aws_instance" "tomcat_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = var.sgp
  subnet_id              = "subnet-e9190a81"
  user_data              = file("apache.sh")
  tags                   = merge(var.taggy, { Name = "Apache-Tomcat-SVR" })
}
