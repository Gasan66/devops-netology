# Provider
provider "aws" {
  shared_credentials_file = "/Users/gasan/.aws/credentials"
  region = "eu-central-1"
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

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
#  description = "netology"
#  root_device_name    = "/dev/sda"

  ebs_block_device {
    device_name = "/dev/sda"
    #    snapshot_id = "snap-xxxxxxxx"
    volume_size = 8
  }

  tags = {
    Name = "netology"
  }
}









#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.61.0"
#    }
#  }
#}

# Provider
#provider "yandex" {
#  token     = "${var.yc_token}"
#  cloud_id  = "${var.yc_cloud_id}"
#  folder_id = "${var.yc_folder_id}"
#  zone      = "${var.yc_region}"
#}


#module "news" {
#  source = "../modules/instance"
#
#  subnet_id     = "${var.yc_subnet_id}"
#  image         = "centos-8"
#  platform_id   = "standard-v2"
#  name          = "news"
#  description   = "News App Demo"
#  instance_role = "news,balancer"
#  users         = "centos"
#  cores         = "2"
#  boot_disk     = "network-ssd"
#  disk_size     = "20"
#  nat           = "true"
#  memory        = "2"
#  core_fraction = "100"
#}

