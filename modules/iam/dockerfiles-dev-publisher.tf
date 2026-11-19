resource "aws_iam_role" "dockerfiles_dev_publisher" {
  count = var.environment == "dev" ? 1 : 0
  name  = "${var.project}-dev-dockerfiles-publisher"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Action    = "sts:AssumeRoleWithWebIdentity"
      Principal = { Federated = data.aws_iam_openid_connect_provider.github_actions.arn }
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          "token.actions.githubusercontent.com:sub" = "repo:Tarakananda@83879016/dockerfiles@1463720839:ref:refs/heads/develop"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "dockerfiles_dev_publisher" {
  count = var.environment == "dev" ? 1 : 0
  name  = "push-pharma-ui-mumbai"
  role  = aws_iam_role.dockerfiles_dev_publisher[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "ecr:GetAuthorizationToken"
        Resource  = "*"
        Condition = { StringEquals = { "aws:RequestedRegion" = "ap-south-1" } }
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
        ]
        Resource = "arn:aws:ecr:ap-south-1:${var.aws_account_id}:repository/pharma-ui"
      },
    ]
  })
}
