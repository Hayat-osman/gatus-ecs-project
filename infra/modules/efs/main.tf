resource "aws_efs_file_system" "main" {
  creation_token = "${var.name_prefix}-efs"
  encrypted      = true

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-efs"
  })
}

resource "aws_efs_mount_target" "main" {
  count = length(var.private_subnet_ids)

  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = [var.efs_sg_id]
}

resource "aws_efs_access_point" "main" {
  file_system_id = aws_efs_file_system.main.id

  posix_user {
    uid = var.efs_config.uid
    gid = var.efs_config.gid
  }

  root_directory {
    path = var.efs_config.path
    creation_info {
      owner_uid   = var.efs_config.uid
      owner_gid   = var.efs_config.gid
      permissions = var.efs_config.permissions
    }
  }

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-efs-ap"
  })
}