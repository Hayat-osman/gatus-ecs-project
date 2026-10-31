output "app_name" {
  description = "CodeDeploy application name"
  value       = aws_codedeploy_app.codedeploy.name
}

output "deployment_group_name" {
  description = "CodeDeploy deployment group name"
  value       = aws_codedeploy_deployment_group.codedeploy.deployment_group_name
}

output "codedeploy_role_arn" {
  description = "IAM role ARN for CodeDeploy"
  value       = aws_iam_role.codedeploy.arn
}

