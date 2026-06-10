variable "name_prefix" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "min_capacity" {
  type = number
}

variable "max_capacity" {
  type = number
}

variable "cpu_target_value" {
  description = "Target CPU utilisation percentage"
  type        = number
}

variable "scale_out_cooldown" {
  description = "Seconds to wait before scaling out again (fast)"
  type        = number
}

variable "scale_in_cooldown" {
  description = "Seconds to wait before scaling in again (slow)"
  type        = number
}