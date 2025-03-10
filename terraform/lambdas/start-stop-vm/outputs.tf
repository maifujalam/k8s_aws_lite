output "start-vm-lambda" {
  value = aws_lambda_function.start-vm-lambda-function.function_name
}
output "stop-vm-lambda" {
  value = aws_lambda_function.stop-vm-lambda-function.function_name
}
