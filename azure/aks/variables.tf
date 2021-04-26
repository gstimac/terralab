variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDrMETRo54vMRYEVBZudY+BFerwcGO8JhlCE3T5/072ky/RUul63FSeRXkg+RlY8acLdPUAZ2hbbe2Ayb5AayjKhiWHXMdMsZnkYnFqnxjpP46PoUUBKDhAcgnqKMdx0gjpCeGpOJMIQlsxFvvWG0w3PgUOZ+fSQXTOqI4RvYhRKCkg/FPPqqeyO9MSkp3l21LwJSQX65o1Liwxxn5RDgiZia9/5Y0eKymy10lw5/Mhyr5C7h6faD10G2uv6HL92jKtqlbG4U+kBz0XVVaNPoqu4/+IFmYfzQF48qfoJkCVTmZKPRNTPalAgm+y+/DlgVCG3XH2yRVj87PySvJO9eaEbSERzG8jk4dbJH96ncvypT1WaBATfQ5lLeYPhrwXe1jipObKhsf56LMIHz9X9LWgMTUWxmrx8G6r8pnA2tY+hKBard8Rw3ns3i7Yr9cV3GAqhjJDxDzLHSXmlWFFwwm4sp72572h5azlQpvipRQstlkbgpnOWc9HdwSjpRhm7rUStBe56W5PN+C589glTkzGdNaxsaBOacJxdSoyioqOEvPN1Hr8Kc4WHh6eZhymm4dPyWfJwoJQ3aar6oRLbDl2RRXUAh+7WMEmWumYYcYZP8t+ye54V0hoGYJGLGv8PC4wZt21WEaiPVJa78BQ1h7C7wIofvnPvofL3oMeY0TBIw== goran@localhost.localdomain"
}

variable "cluster_name" {
  default = ""
}

variable "subscription" {
  default = ""
}

variable "location" {
  type = object({
    full  = string
    short = string
  })
}

variable "availability_zones" {
  default = ["1"]
}

variable "owner" {
  default = ""
}

variable "vnet_name" {
  default = ""
}

variable "vnet_resource_group_name" {
  default = ""
}

variable "subnet_name" {
  default = ""
}

variable "acr_name" {
  default = ""
}

variable "acr_resource_group_name" {
  default = ""
}

variable "environment" {
  default = ""
}

variable "dns_prefix" {
  default = "cicd"
}

variable "sku_tier" {
  default = "Standard_B2s"
}

variable "default_node_pool_name" {
  default = ""
}

variable "default_node_pool_vm_size" {
  default = ""
}

variable "node_count" {
  default = 1
}

variable "auto_scaling_max" {
  default = "3"
}

variable "auto_scaling_min" {
  default = "1"
}