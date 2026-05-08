resource "aws_aim_role" "lambda_role" {
    name= "${var.lambda_function_name}-role"
    assume_role_policy= jsonencode({
        version="2026-10-17"
        Statement=[{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                service= "lambda.amazonaws.com"
            }
        }]
    }
    )
  ###### here
}