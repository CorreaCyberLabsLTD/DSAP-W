# Importa os módulos necessários do Airflow
from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator

# Importa o módulo de configuração do seu projeto
from meuprojeto.config_loader import Config

def load_config():
    # Carrega configurações usando o arquivo padrão e envia para o Airflow
    config_instance = Config()
    config_instance.push_to_airflow()

# Define as propriedades da DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

# Define a DAG
config_dag = DAG(
    'config_dag',
    default_args=default_args,
    description='DAG para carregar configurações',
    schedule_interval='@daily',
)

# Define a tarefa
config_task = PythonOperator(
    task_id='load_config',
    python_callable=load_config,
    dag=config_dag,
)
