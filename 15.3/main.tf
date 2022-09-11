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

resource "yandex_kms_symmetric_key" "key-a" {
  name              = "netology-symetric-key"
  description       = "test key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

// Use keys to create bucket
resource "yandex_storage_bucket" "netology-gasan" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "netology-gasan"
  acl = "public-read"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "netology-gasan"
  key    = "picture.jpg"
  source = "picture.jpg"
}