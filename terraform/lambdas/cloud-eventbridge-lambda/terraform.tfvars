region = "ap-south-1"
lambda_function_start_vm_name = "start-vm-lambda-function"
lambda_function_stop_vm_name = "stop-vm-lambda-function"
# Start Lambda at 9 AM IST (03:30 UTC)
lambda_function_start_vm_cron = "cron(30 3 * * ? *)"

# Stop Lambda at 9 PM IST (15:30 UTC)
lambda_function_stop_vm_cron  = "cron(30 15 * * ? *)"
