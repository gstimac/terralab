resource "hcloud_server" "nextcloud" {
  name        = "fin-cx21c-nextcloud"
  image       = "ubuntu-20.04"
  server_type = "cx21"
  location    = "hel1"
  ssh_keys    = [hcloud_ssh_key.default.id]
  keep_disk   = true
  backups     = false
}

resource "hcloud_server_network" "nextcloud-network" {
  server_id  = hcloud_server.nextcloud.id
  network_id = hcloud_network.lab.id
  ip         = "10.0.1.10"
}
