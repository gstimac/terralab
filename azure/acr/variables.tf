variable "owner" {
  default = "goran.stimac"
}

variable "resource_group_name" {
  default = ""
}

variable "location" {
  type = object({
    full  = string
    short = string
  })
}

variable "sku" {
  default = ""
}

variable "subscription" {
  default = ""
}

variable "environment" {
  default = ""
}