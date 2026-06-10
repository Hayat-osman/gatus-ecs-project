variable "aws_region" {
  type        = string
  default     = "eu-west-2"
}

variable "github_org" {
  type        = string
}

variable "github_repo" {
  type        = string
}

variable "ecr_repository_name" {
  type        = string
}

variable "ecs_task_execution_role_name" {
  type        = string
}

variable "ecs_task_role_name" {
  type        = string
}
