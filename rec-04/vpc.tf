resource "yandex_vpc_network" "rec04_hw" {
  name = "rec04-hw"
}

resource "yandex_vpc_subnet" "hw_subnet_1" {
  name           = "hw-subnet1"
  zone           = "ru-central1-d"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = yandex_vpc_network.rec04_hw.id
}
