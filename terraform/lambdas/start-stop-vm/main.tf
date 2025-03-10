data "archive_file" "start-vm-zip" {
  type        = "zip"
  source_file = "/home/alam/PycharmProjects/k8s_aws/lambdas/start-stop/start_instnce.py"
  output_path = "${path.module}/start_vm_function.zip"
}
data "archive_file" "stop-vm-zip" {
  type        = "zip"
  source_file = "/home/alam/PycharmProjects/k8s_aws/lambdas/start-stop/stop_instnce.py"
  output_path = "${path.module}/stop_vm_function.zip"
}
resource "aws_lambda_function" "start-vm-lambda-function" {
  function_name    = "start-vm-lambda-function"
  role             = data.aws_iam_role.get-role.arn
  handler          = "start_instnce.lambda_handler" # Python handler
  runtime          = "python3.12"
  source_code_hash = filebase64sha256(data.archive_file.start-vm-zip.output_path)
  filename         = data.archive_file.start-vm-zip.output_path
  memory_size      = 128
  timeout          = 10
}
resource "aws_lambda_function" "stop-vm-lambda-function" {
  function_name    = "stop-vm-lambda-function"
  role             = data.aws_iam_role.get-role.arn
  handler          = "stop_instnce.lambda_handler" # Python handler
  runtime          = "python3.12"
  source_code_hash = filebase64sha256(data.archive_file.stop-vm-zip.output_path)
  filename         = data.archive_file.stop-vm-zip.output_path
  memory_size      = 128
  timeout          = 10
}
