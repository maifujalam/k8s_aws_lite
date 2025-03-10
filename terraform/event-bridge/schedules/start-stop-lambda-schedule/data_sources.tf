data "aws_lambda_function" "get-start-vm-lambda-function" {
  function_name = var.start-vm-lambda
}
data "aws_lambda_function" "get-stop-vm-lambda-function" {
  function_name = var.stop-vm-lambda
}
