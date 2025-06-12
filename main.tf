resource "aws_iam_user" "Admin-user" {
name = "Test"
tags = {
  "description" = "created from local"
}
}
resource "aws_iam_policy" "adminuser" {
  name   = "Admin_Users_policy"
  policy = file("admin-policy.json")
}
resource "aws_iam_user_policy_attachment" "Test-admin-access" {
  user       = aws_iam_user.Admin-user.name
  policy_arn = aws_iam_policy.adminuser.arn
}
