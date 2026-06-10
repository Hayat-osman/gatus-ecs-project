resource "aws_cloudwatch_log_group" "main" {
  name              = "/ecs/${var.name_prefix}"
  retention_in_days = var.retention_in_days

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-logs"
  })
}