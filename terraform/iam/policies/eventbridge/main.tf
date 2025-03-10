resource "aws_iam_policy" "lambda-policy" {
  name = "eventbridge-policy-lambda-trigger"
  policy = file("invoke-lambda-policy.json")
}
