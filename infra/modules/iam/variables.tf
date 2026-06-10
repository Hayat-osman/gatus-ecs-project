variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "efs_file_system_arn" {
  description = "EFS file system ARN for task role policy"
  type        = string
}

variable "cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN for task role policy"
  type        = string
}