output "db_endpoint" {
  description = "RDS instance endpoint (hostname:port)"
  value       = aws_db_instance.rds.endpoint
}

output "db_host" {
  description = "RDS instance hostname only"
  value       = aws_db_instance.rds.address
}

output "db_port" {
  description = "RDS instance port"
  value       = aws_db_instance.rds.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.rds.db_name
}

output "db_username" {
  description = "Database master username"
  value       = aws_db_instance.rds.username
  sensitive   = true
}

output "db_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.rds.identifier
}