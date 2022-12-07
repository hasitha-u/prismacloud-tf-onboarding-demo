data "aws_caller_identity" "root" {}

resource "aws_organizations_account" "account" {

  name              = var.account_name
  email             = var.email_address
  role_name         = "owner"
  close_on_deletion = true
  tags = {
    "terraform-managed" : true
  }
}

resource "aws_iam_role" "admin" {
  provider           = aws.sub-account
  name               = "admin"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.root.account_id}:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
  tags = {
    "terraform-managed" : true
  }
}

// Give roles the desired permissions
resource "aws_iam_role_policy_attachment" "admin" {
  provider   = aws.sub-account
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}