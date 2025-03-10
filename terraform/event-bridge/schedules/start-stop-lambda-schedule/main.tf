resource "aws_iam_role" "event-bridge-schedule-iam-role" {
  name = "event-bridge-schedule-assume-role"
  assume_role_policy = file("iam-sts.json")
}
resource "aws_iam_policy" "event-bridge-schedule-policy" {
  name   = "event-bridge-schedule-policy"
  path   = "/"
  policy = file("iam-policy.json")
}
# Attach Policy to Lambda IAM Role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.event-bridge-schedule-iam-role.name
  policy_arn = aws_iam_policy.event-bridge-schedule-policy.arn
}


resource "aws_scheduler_schedule" "start-vm" {
  name                         = "start-vm"
  group_name                   = "default"
  schedule_expression_timezone = "Asia/Calcutta"
  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = var.start-cron
  target {
    arn = data.aws_lambda_function.get-start-vm-lambda-function.arn
    role_arn = aws_iam_role.event-bridge-schedule-iam-role.arn
  }
}
resource "aws_scheduler_schedule" "stop-vm" {
  name                         = "stop-vm"
  group_name                   = "default"
  schedule_expression_timezone = "Asia/Calcutta"
  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = var.stop-cron
  target {
    arn = data.aws_lambda_function.get-stop-vm-lambda-function.arn
    role_arn = aws_iam_role.event-bridge-schedule-iam-role.arn
  }
}
