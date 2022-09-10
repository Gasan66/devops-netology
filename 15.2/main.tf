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
  token     = ""
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

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = ""
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "netology-gasan" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "netology-gasan"
  acl = "public-read"
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "netology-gasan"
  key    = "picture.jpg"
  source = "picture.jpg"
}

resource "yandex_compute_instance_group" "group1" {
  name                = "group1"
  folder_id           = "b1gef0er4511elohdc2q"
  service_account_id  = "ajeqcqd0dc7v4624h5j6"
  deletion_protection = false
  instance_template {
    platform_id = "standard-v3"
    resources {
      memory = 2
      cores  = 2
      core_fraction = 20
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size     = 4
      }
    }
    scheduling_policy {
      preemptible = true
    }
    network_interface {
      network_id = "${yandex_vpc_network.net-netology.id}"
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
      nat = true
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
      user-data = <<-EOT
                    #cloud-config
                    runcmd:
                     - echo '<html><h1><img src=https://storage.yandexcloud.net/netology-gasan/picture.jpg></h1></html>' > index.html
                     - [sudo, cp, -R, index.html, /var/www/html/]
                EOT
    }
    network_settings {
      type = "STANDARD"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }

  health_check {
    http_options {
      port = 80
      path = "/"
    }
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "load balancer target group"
  }
}

resource "yandex_lb_network_load_balancer" "foo" {
  name = "network-load-balancer"

  listener {
    name = "listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_compute_instance_group.group1.load_balancer[0].target_group_id}"

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}