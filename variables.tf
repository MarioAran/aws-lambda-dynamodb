variable "aws_region" {
  description = "region de aws"
  type = string
  default = "eu-west-1"
}

variable "dynamodb_table_name" {
  description = "nombre de la tabla"
  type = string
  default = "CostReports"  
}

variable "lambda_function_name" {
  description = "nombre de lambda"
  type = string
  default = "HelloLambda"
}

variable "increment_timeout" {
  description = "incrementar timerout a 10s"
  type = number
  default = 10
}

variable "memory_lambda" {
  description = "incrementar la memoria"
  type = number
  default = 256
}

variable "enviroment" {
  description = "entorno (dev, stagin, prod)"
  type = string
  default = "dev"
  
}