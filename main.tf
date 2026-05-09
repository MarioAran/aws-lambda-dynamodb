data "archive_file" "lambda_zip" {
    type        = "zip"
    source_file  ="${path.module}/lambda/function.py" 
    output_path   ="${path.module}/lambda/function.zip"
}

resource "aws_lambda_function" "hello_lambda" {
    filename = data.archive_file.lambda_zip.output_path
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda_role.arn
    handler = "function.lambda_handler"  
    runtime = "python3.12"
    timeout = var.lambda_timeout
    memory_size = var.lambda_memory

    source_code_hash = data.archive_file.lambda_zip.output_base64sha256

    environment {
      variables = {
        TABLE_NAME = aws_dynamodb_table.cost_reports.name
      }
    }
    tags = {
      Name = var.lambda_function_name
      Environment = var.environment
      ManagedBy = "Terraform"
    }
}

