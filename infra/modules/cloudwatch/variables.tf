variable "name_prefix" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "retention_in_days" {
  type = number
}