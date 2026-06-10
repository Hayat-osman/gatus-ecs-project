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


variable "efs_config" {
  description = "EFS access point configuration - uid/gid must match container user"
  type = object({
    uid         = number
    gid         = number
    path        = string
    permissions = string
  })
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