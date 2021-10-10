resource "hcloud_ssh_key" "default" {
  name       = "goran@e14"
  public_key = file("~/.ssh/id_rsa.pub")
}
