# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "g-terraform-state"
    region     = "ru-central1"
    key        = "diploma/terraform.tfstate"
    access_key = "YCAJECSaXfGQNoa4c9kaVSZiR"
    secret_key = "YCN474dvv-_QJmbFo-6-JrjOHJOddNvDuumVfniC"

    skip_region_validation      = true
    skip_credentials_validation = true
    workspaces {
      name = "stage"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = "b1g32us03hkhaselg0p1"
  folder_id = "b1gt3mocmepsson4d3m0"
  zone      = "ru-central1-a"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = var.service_account_id
  description        = "static access key for object storage"
}

resource "yandex_vpc_network" "net-netology" {
  name = "net-netology"
}

resource "yandex_vpc_subnet" "public" {
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.net-netology.id
}

resource "yandex_vpc_subnet" "private1" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.net-netology.id}"
}

resource "yandex_vpc_subnet" "private2" {
  v4_cidr_blocks = ["192.168.30.0/24"]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.net-netology.id}"
}

resource "yandex_kms_symmetric_key" "key-k8s" {
  name              = "netology-symetric-key-k8s"
  description       = "k8s key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

resource "yandex_container_registry" "dipl-reg" {
  name = "dipl-registry"
  folder_id = "b1gt3mocmepsson4d3m0"
}

resource "yandex_kubernetes_cluster" "diploma_regional_cluster" {
  name        = "my-k8s-cluster"
  description = "description"

  network_id = "${yandex_vpc_network.net-netology.id}"

  master {
    regional {
      region = "ru-central1"

      location {
        zone      = "${yandex_vpc_subnet.public.zone}"
        subnet_id = "${yandex_vpc_subnet.public.id}"
      }

      location {
        zone      = "${yandex_vpc_subnet.private1.zone}"
        subnet_id = "${yandex_vpc_subnet.private1.id}"
      }

      location {
        zone      = "${yandex_vpc_subnet.private2.zone}"
        subnet_id = "${yandex_vpc_subnet.private2.id}"
      }
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        day        = "monday"
        start_time = "15:00"
        duration   = "3h"
      }

      maintenance_window {
        day        = "friday"
        start_time = "10:00"
        duration   = "4h30m"
      }
    }
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  labels = {
    my_key       = "my_value"
    my_other_key = "my_other_value"
  }

  kms_provider {
    key_id = "${yandex_kms_symmetric_key.key-k8s.id}"
  }

  release_channel = "STABLE"
}

resource "yandex_kubernetes_node_group" "my_node_group" {
  cluster_id  = "${yandex_kubernetes_cluster.diploma_regional_cluster.id}"
  name        = "my-first-node-group"
  description = "description"

  labels = {
    "key" = "value"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = ["${yandex_vpc_subnet.public.id}"]
    }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    auto_scale {
      min = 3
      max = 6
      initial = 3
    }

  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true

    maintenance_window {
      day        = "monday"
      start_time = "15:00"
      duration   = "3h"
    }

    maintenance_window {
      day        = "friday"
      start_time = "10:00"
      duration   = "4h30m"
    }
  }
}