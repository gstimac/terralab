resource "hcloud_network" "lab" {
  name     = "lab-network"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "nextcloud" {
  network_id   = hcloud_network.lab.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}