output "public_ip" {
  value = aws_instance.MyEc2Instance.public_ip
}