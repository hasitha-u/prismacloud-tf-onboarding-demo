provider "googleworkspace" {
  customer_id = var.googleworkspace_customer_id
}

data "googleworkspace_users" "all_users" {}

# Sync Google Workspace users to AWS SCIM
resource "aws-sso-scim_user" "user" {
  for_each = {
    for user in data.googleworkspace_users.all_users.users : user.primary_email => {
      display_name = one(user.name).full_name
      family_name  = one(user.name).family_name
      given_name   = one(user.name).given_name
      suspended    = user.suspended
    }
  }
  display_name = each.value.display_name
  family_name  = each.value.family_name
  given_name   = each.value.given_name
  user_name    = each.key
  active       = !each.value.suspended
}

data "aws_ssoadmin_instances" "sso" {}

locals {
  sso_instance_arn = one(data.aws_ssoadmin_instances.sso.arns)
}

resource "aws_ssoadmin_permission_set" "admin" {
  name         = "Admin"
  instance_arn = local.sso_instance_arn
}

resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}