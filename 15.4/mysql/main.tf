# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yandex_cloud_token
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
  network_id     = yandex_vpc_network.net-netology.id
}

resource "yandex_vpc_subnet" "private" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.net-netology.id}"
}

resource "yandex_mdb_mysql_cluster" "db_cluster" {
  name        = "my_first_cluster"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.net-netology.id
  version     = "8.0"
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours = 23
    minutes = 59
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.public.id
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.private.id
  }
}

resource "yandex_mdb_mysql_database" "my_database" {
  cluster_id = yandex_mdb_mysql_cluster.db_cluster.id
  name       = "netology_db"
}

resource "yandex_mdb_mysql_user" "my_user" {
    cluster_id = yandex_mdb_mysql_cluster.db_cluster.id
    name       = "my_first_user"
    password   = "password"

    permission {
      database_name = yandex_mdb_mysql_database.my_database.name
      roles         = ["ALL"]
    }

    connection_limits {
      max_questions_per_hour   = 10
      max_updates_per_hour     = 20
      max_connections_per_hour = 30
      max_user_connections     = 40
    }

    global_permissions = ["PROCESS"]

    authentication_plugin = "SHA256_PASSWORD"
}