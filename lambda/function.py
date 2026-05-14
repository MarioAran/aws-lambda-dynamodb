import json
import boto3
import time
from datetime import datetime
from decimal import Decimal  # D mayúscula
import os 
dynamodb = boto3.resource('dynamodb')
TABLE_NAME = os.environ.get('TABLE_NAME', 'CostReports')
table = dynamodb.Table(TABLE_NAME)
def convert_floats_to_decimal(obj):
    if isinstance(obj, float):
        return Decimal(str(obj))
    elif isinstance(obj, dict):
        return {k: convert_floats_to_decimal(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [convert_floats_to_decimal(i) for i in obj]
    else:
        return obj

def lambda_handler(event, context):
    print("Evento recibido:", json.dumps(event))
    
    body = {}
    if 'body' in event:
        try:
            body = json.loads(event['body'])
        except:
            body = {'message': event['body']}
    
    report_id = int(time.time() * 1000)
    current_time = datetime.now().isoformat()
    
    body_converted = convert_floats_to_decimal(body)
    
    item = {
        'id': report_id,
        'timestamp': current_time,
        'data': body_converted
    }
    
    try:
        table.put_item(Item=item)
        print(f"Guardado ID: {report_id}")
        return {
            'statusCode': 200,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps({
                'message': 'Reporte guardado correctamente',
                'id': report_id
            })
        }
    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps({
                'message': 'Error al guardar',
                'error': str(e)
            })
        }
