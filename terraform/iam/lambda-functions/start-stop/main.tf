resource "aws_iam_policy" "start-stop-policy" {
  name   = "start-stop-policy"
  path   = "/"
  policy = file("start-stop-policy.json")
}
resource "aws_iam_role" "start-stop-iam-role" {
  name = "start-stop-assume-role"
  assume_role_policy = file("iam-sts.json")
}
# Attach Policy to Lambda IAM Role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.start-stop-iam-role.name
  policy_arn = aws_iam_policy.start-stop-policy.arn
}
