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
  type    = number
  default = 2
}

variable "max_capacity" {
  type    = number
  default = 4
}

variable "cpu_target_value" {
  description = "Target CPU utilisation percentage"
  type        = number
  default     = 70
}

variable "scale_out_cooldown" {
  description = "Seconds to wait before scaling out again (fast)"
  type        = number
  default     = 60
}

variable "scale_in_cooldown" {
  description = "Seconds to wait before scaling in again (slow)"
  type        = number
  default     = 300
}