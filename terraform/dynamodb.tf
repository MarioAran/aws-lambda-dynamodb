resource "aws_dynamodb_table" "cost_reports" {
    name = var.dynamodb_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "id"
    
    attribute {
        name = "id"
        type = "N"
    }

    tags = {
        Name        = var.dynamodb_table_name
        Enviroment  = var.environment
        Project     = "Devops-Learning"
        ManagedBy   ="terraform"
    }
}