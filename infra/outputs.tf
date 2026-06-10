output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "app_url" {
  value = module.dns.app_url
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group_name
}

output "certificate_arn" {
  value = module.acm.certificate_arn
}

output "efs_file_system_id" {
  value = module.efs.efs_file_system_id
}

output "efs_access_point_id" {
  value = module.efs.efs_access_point_id
}

output "alb_sg_id" {
  value = module.security_groups.alb_sg_id
}

output "ecs_sg_id" {
  value = module.security_groups.ecs_sg_id
}

output "efs_sg_id" {
  value = module.security_groups.efs_sg_id
}

output "ecs_execution_role_arn" {
  value = module.iam.ecs_execution_role_arn
}

output "ecs_task_role_arn" {
  value = module.iam.ecs_task_role_arn
}