# Provider
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAAAHIIEeAATuwQAAAADN8uoQYIGp7hkJSFePgIW-cB5Sd7U1n5A"
  cloud_id  = "b1g32us03hkhaselg0p1"
  folder_id = "b1gef0er4511elohdc2q"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "net-netology" {
  name = "net-netology"
}

resource "yandex_vpc_subnet" "public" {
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net-netology.id}"
}

resource "yandex_vpc_subnet" "private" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net-netology.id}"
  route_table_id = "${yandex_vpc_route_table.rt-netology.id}"
}

resource "yandex_vpc_route_table" "rt-netology" {
  network_id = "${yandex_vpc_network.net-netology.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

resource "yandex_compute_instance" "nat" {
  name        = "nat"
  zone        = "ru-central1-a"
  hostname    = "nat"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}"
    ip_address = "192.168.10.254"
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "front" {
  name        = "front"
  zone        = "ru-central1-a"
  hostname    = "front"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8uoiksr520scs811jl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}"
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "back" {
  name        = "back"
  zone        = "ru-central1-a"
  hostname    = "back"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8uoiksr520scs811jl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.private.id}"
    nat = false

  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}






#provider "aws" {
#  shared_credentials_file = "/Users/gasan/.aws/credentials"
#  region = "eu-central-1"
#}
#
#locals {
#  web_instance_count_map = {
#    stage = 1
#    prod  = 2
#  }
#}
#
#data "aws_caller_identity" "current" {}
#
#data "aws_region" "current" {}
#
#module "my_instance" {
#  source = "../modules/instances/"
#
#  count = local.web_instance_count_map[terraform.workspace]
#}
#
#module "fromEC2module" {
#  source = "terraform-aws-modules/ec2-instance/aws"
#
#  name = "single-instance"
#
#  ami                    = "ami-ebd02392"
#  instance_type          = "t2.micro"
#  key_name               = "user1"
#  monitoring             = true
#  tags = {
#    Name = "netology"
#  }
#}











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

