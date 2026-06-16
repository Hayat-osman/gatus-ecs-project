
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  name_prefix     = local.name_prefix
  aws_region      = var.aws_region
  common_tags     = local.common_tags
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id            = module.vpc.vpc_id
  name_prefix       = local.name_prefix
  common_tags       = local.common_tags
  ecs_ingress_ports = var.ecs_ingress_ports
}

module "acm" {
  source = "./modules/acm"

  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.main.zone_id
  name_prefix = local.name_prefix
  common_tags = local.common_tags
}


module "ecs" {
  source = "./modules/ecs"

  name_prefix               = local.name_prefix
  common_tags               = local.common_tags
  aws_region                = var.aws_region
  container_image           = var.container_image
  container_port            = var.container_port
  container_cpu             = var.container_cpu
  container_memory          = var.container_memory
  desired_count             = var.desired_count
  execution_role_arn        = module.iam.ecs_execution_role_arn
  task_role_arn             = module.iam.ecs_task_role_arn
  cloudwatch_log_group_name = module.cloudwatch.log_group_name
  private_subnet_ids        = module.vpc.private_subnet_ids
  ecs_sg_id                 = module.security_groups.ecs_sg_id
  target_group_arn          = module.alb.target_group_arn
}

module "iam" {
  source = "./modules/iam"

  name_prefix              = local.name_prefix
  common_tags              = local.common_tags
  cloudwatch_log_group_arn = module.cloudwatch.log_group_arn
}

module "dns" {
  source = "./modules/dns"

  zone_id      = data.aws_route53_zone.main.zone_id
  domain_name  = var.domain_name
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
  name_prefix  = local.name_prefix
}

module "alb" {
  source = "./modules/alb"

  name_prefix       = local.name_prefix
  common_tags       = local.common_tags
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  certificate_arn   = module.acm.certificate_arn
  container_port    = var.container_port
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  name_prefix       = local.name_prefix
  common_tags       = local.common_tags
  retention_in_days = var.retention_in_days
}

module "autoscaling" {
  source = "./modules/autoscaling"

  name_prefix        = local.name_prefix
  cluster_name       = module.ecs.cluster_name
  service_name       = module.ecs.service_name
  min_capacity       = var.desired_count
  max_capacity       = var.desired_count * 2
  cpu_target_value   = var.autoscaling_cpu_target
  scale_out_cooldown = var.autoscaling_scale_out_cooldown
  scale_in_cooldown  = var.autoscaling_scale_in_cooldown
}