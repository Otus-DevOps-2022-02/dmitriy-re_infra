terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.73.0"
    }
  }
}

#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#    }
#  }
#  required_version = ">= 0.13"
#}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}


#data "yandex_vpc_subnet" "app-network" {
#  subnet_id = yandex_vpc_subnet.app-network.id
#}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = yandex_vpc_subnet.app-subnet.id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = yandex_vpc_subnet.app-subnet.id
}

#resource "yandex_compute_instance" "app" {
#  name = "reddit-app"

#  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
#  }

#  resources {
#    cores  = 2
#    memory = 2
#  }

#  boot_disk {
#    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
#      image_id = var.image_id
#    }
#  }

#  network_interface {
    # Указан id подсети default-ru-central1-a
#    subnet_id = var.subnet_id
#    nat       = true
#  }

#  network_interface {
#    subnet_id = yandex_vpc_subnet.app-subnet.id
#    nat = true
#  }

#  connection {
#    type  = "ssh"
#    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
#    user  = "ubuntu"
#    agent = false
    # путь до приватного ключа
#    private_key = file(var.private_key_path)
#  }

#  provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }

#  provisioner "remote-exec" {
#    script = "files/deploy.sh"
#  }

#}
