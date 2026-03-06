variable "ou_id_map" {
  type = map(string)
}
variable "account_name" {
  type = string
}

variable "organizational_unit" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "account_email" {
  type = string
}
