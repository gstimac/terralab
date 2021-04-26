variable "subscription" {
  default = ""
}

variable "environment" {
  default = ""
}

variable "location" {
  type = object({
    full  = string
    short = string
  })
}

variable "owner" {
  default = ""
}