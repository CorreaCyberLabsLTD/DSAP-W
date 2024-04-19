# Usando uma imagem base específica e nomeando o estágio de construção
FROM apache/airflow:2.9.0-python3.11 as build

# Definindo o usuário root para instalação de pacotes necessários
USER root

# Instalando dependências do sistema de forma eficiente e limpando em um único RUN
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       flex bison automake libtool make gcc pkg-config libssl-dev \
       pkg-config libxml2-dev libxmlsec1-dev libxmlsec1-openssl git \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Mudando para o usuário airflow antes de instalar pacotes Python para evitar problemas de permissão
USER airflow
# Atualizando o pip como usuário root para garantir acesso total
RUN pip install --upgrade pip



# Copiando e instalando pacotes e dependências Python
COPY  soar-1.13.0-py3-none-any.whl .
COPY  meuprojeto-0.0.0-py3-none-any.whl .
RUN pip install /opt/airflow/*.whl \
    && pip install connexion[swagger-ui] \
       apache-airflow-providers-mongo \
       apache-airflow-providers-mysql \
       apache-airflow-providers-neo4j \
       apache-airflow-providers-slack \
       apache-airflow-providers-telegram


RUN pip install "apache-airflow[celery]==2.9.0" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.9.0/constraints-3.11.txt"

# Copiando arquivos de configuração
COPY config/ /opt/airflow/config/

# Copiando os DAGs
COPY dags/ /opt/airflow/dags/
