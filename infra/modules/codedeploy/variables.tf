variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "https_listener_arn" {
  description = "ARN of the ALB HTTPS listener"
  type        = string
}

variable "blue_target_group_name" {
  description = "Name of the blue (current) target group"
  type        = string
}

variable "green_target_group_name" {
  description = "Name of the green (replacement) target group"
  type        = string
}
variable "alb_5xx_alarm_name" {
  description = "CloudWatch alarm name to monitor for automatic rollback"
  type        = string
}

variable "codedeploy_role_arn" {
  description = "IAM role ARN for CodeDeploy"
  type        = string
}