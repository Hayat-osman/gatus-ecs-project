resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]

  tags = {
    Name    = "github-actions-oidc"
    Purpose = "CI/CD authentication"
  }
}

resource "aws_iam_role" "build_push" {
  name               = "github-build-push-role"
  assume_role_policy = local.trust_main_only
}

resource "aws_iam_role_policy" "build_push" {
  name = "build-push-policy"
  role = aws_iam_role.build_push.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecr:GetAuthorizationToken"]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage",
          "ecr:DescribeImages"
        ]
        Resource = "arn:aws:ecr:${var.aws_region}:${data.aws_caller_identity.current.account_id}:repository/${var.ecr_repository_name}"
      }
    ]
  })
}


resource "aws_iam_role" "deploy" {
  name               = "github-deploy-role"
  assume_role_policy = local.trust_main_only
}

resource "aws_iam_role_policy" "deploy" {
  name = "deploy-policy"
  role = aws_iam_role.deploy.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecr:GetAuthorizationToken"]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ]
        Resource = "arn:aws:ecr:${var.aws_region}:${data.aws_caller_identity.current.account_id}:repository/${var.ecr_repository_name}"
      },
      {
        Effect = "Allow"
        Action = [
          "ecs:RegisterTaskDefinition",
          "ecs:UpdateService",
          "ecs:DescribeServices",
          "ecs:DescribeTaskDefinition",
          "ecs:DescribeTasks",
          "ecs:ListTasks"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = ["iam:PassRole"]
        Resource = [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.ecs_task_execution_role_name}",
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.ecs_task_role_name}"
        ]
      },
      {
        Effect   = "Allow"
        Action   = ["logs:DescribeLogGroups"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "tf_plan" {
  name               = "github-tf-plan-role"
  assume_role_policy = local.trust_main_and_pr
}

resource "aws_iam_role_policy" "tf_plan" {
  name = "tf-plan-policy"
  role = aws_iam_role.tf_plan.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "ecs:Describe*",
          "ecs:List*",
          "iam:Get*",
          "iam:List*",
          "acm:Describe*",
          "acm:List*",
          "elasticloadbalancing:Describe*",
          "route53:Get*",
          "route53:List*",
          "elasticfilesystem:Describe*",
          "logs:ListTagsForResource",
          "logs:Describe*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket"]
        Resource = [
          "arn:aws:s3:::hayats-labs-terraform-state",
          "arn:aws:s3:::hayats-labs-terraform-state/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "tf_apply" {
  name               = "github-tf-apply-role"
  assume_role_policy = local.trust_main_only
}

resource "aws_iam_role_policy" "tf_apply" {
  name = "tf-apply-policy"
  role = aws_iam_role.tf_apply.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}