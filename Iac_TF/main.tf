resource "aws_instance" "tomcat_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = ["var.sgp"]
    user_data = file("./apache.sh")
    tags = {
        Name = merge(var.taggy, { Name = "Apache-Tomcat-SVR" })
    }
}
