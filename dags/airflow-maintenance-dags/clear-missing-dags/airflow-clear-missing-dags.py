# Importa os módulos necessários do Airflow
from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator

# Importa o módulo de conexão MongoDB do seu projeto
from meuprojeto.dta import MongoDBConnection

def mongodb_operations():
    # Cria uma instância da conexão MongoDB
    mongo_conn = MongoDBConnection()

    # Conecta ao MongoDB e obtém uma instância do banco de dados
    db = mongo_conn.get_database('Crawler')

    # Operações no MongoDB, por exemplo, listar as coleções disponíveis
    print(db.list_collection_names())

# Define as propriedades da DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

# Define a DAG
mongodb_dag = DAG(
    'mongodb_dag',
    default_args=default_args,
    description='DAG para operações no MongoDB',
    schedule_interval='@daily',
)

# Define a tarefa
mongodb_task = PythonOperator(
    task_id='mongodb_operations',
    python_callable=mongodb_operations,
    dag=mongodb_dag,
)
