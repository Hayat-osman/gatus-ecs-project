aws_region   = "eu-west-2"
project_name = "gatus"
environment  = "dev"
vpc_cidr     = "10.0.0.0/22"

public_subnets = {
  public_1 = {
    cidr = "10.0.0.0/24"
    az   = "eu-west-2a"
  }
  public_2 = {
    cidr = "10.0.1.0/24"
    az   = "eu-west-2b"
  }
}

private_subnets = {
  private_1 = {
    cidr = "10.0.2.0/24"
    az   = "eu-west-2a"
  }
  private_2 = {
    cidr = "10.0.3.0/24"
    az   = "eu-west-2b"
  }
}

ecs_ingress_ports = [8080]

domain_name = "hayats-labs.com"

efs_config = {
  uid         = 65532
  gid         = 65532
  path        = "/gatus"
  permissions = "755"
}

container_port                 = 8080
container_cpu                  = 256
container_memory               = 512
retention_in_days              = 30
autoscaling_cpu_target         = 70
autoscaling_scale_out_cooldown = 60
autoscaling_scale_in_cooldown  = 300
desired_count                  = 2