output "dynamodb_table_name" {
    description = "nombre de la tabla de dynamodb"
    value = aws_dynamodb_table.cost_reports.name
}

output "lambda_function_name" {
    description = "Nombre de la función Lambda"
    value = var.lambda_function_name
}

output "lambda_role_arn" {
    description = "ARN del rol IAM de Lambda"
    value = aws_iam_role.lambda_role.arn
  
}