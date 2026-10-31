variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}


variable "cloudwatch_log_group_arn" {
  description = "CloudWatch log group ARN for task role policy"
  type        = string
}
variable "db_secret_arn" {
  description = "ARN of the Secrets Manager secret containing DB credentials"
  type        = string
}