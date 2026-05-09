# Lambda + DynamoDB API with Terraform

## Descripción
API serverless que guarda reportes de costes en DynamoDB.

## Tecnologías
- Terraform (Infraestructura como código)
- AWS Lambda (Python 3.12)
- AWS DynamoDB (NoSQL)
- IAM (permisos granulares)

## Arquitectura
`Lambda (Python) → DynamoDB (Tabla)`

## Cómo desplegar
```bash
terraform init
terraform plan
terraform apply
```

# Evento de prueba
{
  "body": "{\"service\":\"EC2\",\"cost\":12.50}"
}

terraform destroy