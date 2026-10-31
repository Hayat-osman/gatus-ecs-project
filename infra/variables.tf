variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  description = "Map of public subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "ecs_ingress_ports" {
  description = "Ports to allow inbound on ECS from ALB"
  type        = list(number)
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
}



variable "container_image" {
  description = "ECR image URI for Gatus container"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "container_cpu" {
  description = "CPU units for ECS task"
  type        = number
}

variable "container_memory" {
  description = "Memory for ECS task in MB"
  type        = number
}

variable "retention_in_days" {
  type = number
}

variable "autoscaling_cpu_target" {
  description = "Target CPU utilisation percentage for autoscaling"
  type        = number
}

variable "autoscaling_scale_out_cooldown" {
  description = "Seconds before scaling out again"
  type        = number
}

variable "autoscaling_scale_in_cooldown" {
  description = "Seconds before scaling in again"
  type        = number
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_multi_az" {
  description = "Enable Multi-AZ for RDS"
  type        = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection on RDS"
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot on RDS deletion"
  type        = bool
}

variable "db_backup_retention_period" {
  description = "Days to retain RDS automated backups"
  type        = number
}

variable "alarm_evaluation_periods" {
  description = "Number of periods the alarm must be in breach before triggering"
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

variable "alb_arn_suffix" {
  description = "ALB ARN suffix for CloudWatch metrics (the app/name/id part)"
  type        = string
}