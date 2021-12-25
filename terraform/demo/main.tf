# Provider
provider "aws" {
  shared_credentials_file = "/Users/gasan/.aws/credentials"
  region = "eu-central-1"
}

locals {
  web_instance_count_map = {
    stage = 1
    prod  = 2
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "my_instance" {
  source = "../modules/instances/"

  count = local.web_instance_count_map[terraform.workspace]
}

module "fromEC2module" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
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

