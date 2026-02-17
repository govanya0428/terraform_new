resource "aws_instance" "MyEc2Instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = "subnet-0222a7aa0ac4d8437"
  key_name      = "DevOps"
}

resource "aws_eip" "myec2ip" {
  instance = aws_instance.MyEc2Instance.id
  domain  = "vpc"

}
resource "aws_ebs_volume" "NewDisk" {
  availability_zone = aws_instance.MyEc2Instance.availability_zone
  size              = 8
  type = "gp3"
}
resource "aws_volume_attachment" "NewDiskAttachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.NewDisk.id
  instance_id = aws_instance.MyEc2Instance.id
}