output "efs_access_point_id" {
  value = aws_efs_access_point.main.id
}

output "efs_file_system_arn" {
  description = "EFS file system ARN"
  value       = aws_efs_file_system.main.arn
}
output "efs_file_system_id" {
  value = aws_efs_file_system.main.id
}