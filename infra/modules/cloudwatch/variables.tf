variable "name_prefix" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "retention_in_days" {
  type = number
}
variable "alb_arn_suffix" {
  description = "ALB ARN suffix for CloudWatch metrics"
  type        = string
}

variable "alarm_evaluation_periods" {
  description = "Number of periods the alarm must breach before triggering"
  type        = number
}

variable "alarm_period_seconds" {
  description = "Period in seconds for each alarm evaluation"
  type        = number
}

variable "alarm_5xx_threshold" {
  description = "Number of 5xx errors per period that triggers rollback"
  type        = number
}

