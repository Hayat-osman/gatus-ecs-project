variable "name_prefix" {
  type = string
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "efs_config" {
  type = object({
    uid         = number
    gid         = number
    path        = string
    permissions = string
  })
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for mount targets"
  type        = list(string)
}

variable "efs_sg_id" {
  description = "EFS security group ID"
  type        = string
}