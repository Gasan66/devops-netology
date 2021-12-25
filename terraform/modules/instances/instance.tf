locals {
  web_instance_type_map = {
    stage = "t2.nano"
    prod  = "t2.micro"
  }
  web_instance_count_map = {
    stage = 1
    prod  = 2
  }
  instances = {
    "t2.nano" = data.aws_ami.ubuntu.id
    "t2.micro" = data.aws_ami.ubuntu.id
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["aws-marketplace"]
}


resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.web_instance_type_map[terraform.workspace]

  lifecycle {
   create_before_destroy = true
  }

  ebs_block_device {
    device_name = "/dev/sda"
    volume_size = 8
  }

  tags = {
    Name = "netology"
  }
}