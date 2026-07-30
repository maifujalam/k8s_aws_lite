data "aws_lambda_function" "get_lambda_start_vm" {
  function_name = var.lambda_function_start_vm_name
}
data "aws_lambda_function" "get_lambda_stop_vm" {
  function_name = var.lambda_function_stop_vm_name
}