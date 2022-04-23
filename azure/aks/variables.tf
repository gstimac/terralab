variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw/V7mahbD34hmQucJ34m/+jxBv4YtOD6R0xKt62lITPKKZlEeyfx4MkSI+kgi4S5hDlcEvDnggKnCld7v7JnD3ETUcf3OYnB011kOE3b6cyN65lZKRNMngzK7NjlEzohlHDhK/ZEOzI+YeQCAMQQAFyLYRiF4o2/lz5gm0Y1fPR8mJZqNppgT8b/+RSM1xi9szZS55ef6RB7bEjcGaE7+0tFTQJKt1wCkFtsnDdh6CX/bNhvdxAeh9bp8P/2vVy6zGsFsIhYroshyVq62a6n+Q/du69ikkYuVz11seZq/3NoODRQiySLcWOmWuTH5OJ9SzYcRdLqwYjLjO76qJs1CzXd5xnnDSq/GEQwFZJowt3VW2GaXtL3EYCM6KjR5tesZPq35e2LIfpQLxiVfl8jQtlUGfOiRIfgPjlL+fCO5Q/XpeauhPi99X+gI0MQCckej2ACGRNw1uHVOKzJU7SeMVPIWHEA7MekAymhPY9lqBZD0Ref9VO54yrELyepxYhw2/ZaU0attm9Fgdw814xQAiswh6FBdcFCljfEfqSLe/+QsJvhqxT+GHEEMqFvZmkxwn4jcfB6f3+5n3Qkm6m7udqbnp5tvzhIujTef+h7YKAbIbvdX2+yBkHfnpHxerIc7aT1OQ4hs2ErTLZWRporXXZPdh+xiWasCZg7CnEbFrQ== goran@m1.local"
}

variable "cluster_name" {
  default = "lab"
}

variable "subscription" {
  default = "320c6aee-903c-465f-81d1-9463af62e06f"
}

variable "location" {
  type = object({
    full  = string
    short = string
  })
  default = {
    full  = "eastus"
    short = "eus"
  }
}

variable "owner" {
  default = "goran.stimac"
}

variable "vnet_name" {
  default = "main-eus-VNET"
}

variable "vnet_resource_group_name" {
  default = "main-eus-vnet-RG"
}

variable "subnet_name" {
  default = "cicd-SNET"
}

variable "acr_name" {
  default = ""
}

variable "acr_resource_group_name" {
  default = ""
}

variable "environment" {
  default = "dev"
}

variable "dns_prefix" {
  default = "cicd"
}

variable "sku_tier" {
  default = "Basic"
}

variable "default_node_pool_name" {
  default = "default"
}

variable "default_node_pool_vm_size" {
  default = "Standard_B2s"
}

variable "node_count" {
  default = 1
}

variable "enable_autoscaling" {
  default = "true"
}

variable "auto_scaling_max" {
  default = "3"
}

variable "auto_scaling_min" {
  default = "1"
}
