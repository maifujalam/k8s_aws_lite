# Start V Cron
resource "aws_cloudwatch_event_rule" "daily_trigger_start" {
  name                = "trigger-start-vm-cron"
  schedule_expression = var.lambda_function_start_vm_cron

}

resource "aws_cloudwatch_event_rule" "daily_trigger_stop" {
  name                = "trigger-stop-vm-cron"
  schedule_expression = var.lambda_function_stop_vm_cron
}
# Attach Lambda as target start VM and cron
resource "aws_cloudwatch_event_target" "lambda_target_start" {
  rule      = aws_cloudwatch_event_rule.daily_trigger_start.name
  target_id = "lambda-start"
  arn       = data.aws_lambda_function.get_lambda_start_vm.arn
}

# Attach Lambda as target stop VM and cron
resource "aws_cloudwatch_event_target" "lambda_target_stop" {
  rule      = aws_cloudwatch_event_rule.daily_trigger_stop.name
  target_id = "lambda-stop"
  arn       = data.aws_lambda_function.get_lambda_stop_vm.arn
}

# Permission so EventBridge can invoke Start Lambda
resource "aws_lambda_permission" "allow_eventbridge_start" {
  statement_id  = "AllowExecutionFromEventBridgeStart"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.get_lambda_start_vm.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.daily_trigger_start.arn
}


# Permission so EventBridge can invoke Stop Lambda
resource "aws_lambda_permission" "allow_eventbridge_stop" {
  statement_id  = "AllowExecutionFromEventBridgeStop"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.get_lambda_stop_vm.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.daily_trigger_stop.arn
}