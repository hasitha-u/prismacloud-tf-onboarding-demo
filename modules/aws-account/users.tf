data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_instance_arn = one(data.aws_ssoadmin_instances.sso.arns)
}

data "aws_ssoadmin_permission_set" "admin" {
  instance_arn = local.sso_instance_arn
  name         = "Admin"
}

resource "aws_ssoadmin_account_assignment" "account_admins" {
  for_each = toset(var.admin_users)

  instance_arn       = local.sso_instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.admin.arn
  target_id          = aws_organizations_account.account.id
  target_type        = "AWS_ACCOUNT"
  principal_id       = each.value
  principal_type     = "USER"
}
