output "JenMachine_pub_id" {
    value = aws_instance.anhdo-ec2.public_ip
}

output "ConMachine_pub_id" {
    value = aws_instance.anhdo-ec2-control.public_ip
}

output "TarMachine_pub_id" {
    value = aws_instance.anhdo-ec2-target.public_ip
}

output "TarMachine_pri_id" {
    value = aws_instance.anhdo-ec2-target.private_ip
}