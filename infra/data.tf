data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

data "aws_secretsmanager_secret" "db" {
  name = "secret2"
}

data "aws_secretsmanager_secret_version" "db_current" {
  secret_id = data.aws_secretsmanager_secret.db.id
}