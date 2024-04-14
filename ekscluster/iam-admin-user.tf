
# Resource: AWS IAM User - Admin User (Has Full AWS Access)
resource "aws_iam_user" "admin_user" {
  for_each      = var.user
  name          = each.value
  path          = "/"
  force_destroy = true
  tags          = local.common_tags
}

# Resource: AWS IAM User Policy - EKS Dashboard Full Access
resource "aws_iam_user_policy" "admin_user_eks_policy" {
  for_each = aws_iam_user.admin_user
  name     = "${local.name}-eks-dashboard-full-access-policy"
  user     = each.value.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListRoles",
          "eks:*",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
        Resource = "${aws_eks_cluster.eks_cluster.arn}"
      },
      {
        Action   = [
          "iam:PassRole",
          "eks:*"
        ]
        Effect   = "Allow"
        Resource = "${aws_iam_role.eks_admin_role.arn}"
      },      
    ]
  })
}

# Resource: Admin Access Policy - Attach it to admin user
resource "aws_iam_user_policy_attachment" "admin_user" {
  for_each   = aws_iam_user.admin_user
  user       = each.value.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
