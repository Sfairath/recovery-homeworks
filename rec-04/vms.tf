resource "yandex_compute_instance" "vm" {
  count       = 2
  name        = "rec04-${count.index}"
  hostname    = "rec04-${count.index}"
  platform_id = "standard-v3"
  zone        = "ru-central1-d"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd80bm0rh4rkepi5ksdi"
      type     = "network-hdd"
      size     = "10"
    }
  }

  metadata = {
    user-data          = file("./cloud-init.yaml")
    serial-port-enable = 1
  }

  scheduling_policy { preemptible = true }

  network_interface {
    nat       = true
    subnet_id = yandex_vpc_subnet.hw_subnet_1.id
  }
}
