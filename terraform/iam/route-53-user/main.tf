resource "aws_iam_user" "route53_user" {
  name = "route-53-user"
  path = "/"
}
resource "aws_iam_policy" "lets-encrypt" {
  name   = "lets-encrypt-policy"
  path   = "/"
  policy = file("lets-encrypt-policy.json")
}

resource "aws_iam_user_policy_attachment" "route53_user_policy_attachment" {
  user       = aws_iam_user.route53_user.name
  policy_arn = aws_iam_policy.lets-encrypt.arn
}
resource "aws_iam_access_key" "route53_user_key" {
  user = aws_iam_user.route53_user.name
}