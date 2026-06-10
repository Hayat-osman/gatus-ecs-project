output "build_push_role_arn" {
  value       = aws_iam_role.build_push.arn
}

output "deploy_role_arn" {
  value       = aws_iam_role.deploy.arn
}

output "tf_plan_role_arn" {
  value       = aws_iam_role.tf_plan.arn
}

output "tf_apply_role_arn" {
  value       = aws_iam_role.tf_apply.arn
}
