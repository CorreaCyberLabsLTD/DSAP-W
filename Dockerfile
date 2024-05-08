# Usando uma imagem base específica e nomeando o estágio de construção
FROM apache/airflow:latest-python3.12 as build

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
# CorreaLabs Dependencia
RUN pip3 install sadif

RUN pip install connexion[swagger-ui] \
       apache-airflow-providers-mongo \
       apache-airflow-providers-mysql \
       apache-airflow-providers-neo4j \
       apache-airflow-providers-slack \
       apache-airflow-providers-telegram



# Copiando arquivos de configuração
COPY config/ /opt/airflow/config/

# Copiando os DAGs
COPY dags/ /opt/airflow/dags/
