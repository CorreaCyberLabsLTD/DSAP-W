# Airflow Setup Project

This project sets up Apache Airflow in a Docker environment using Docker Compose. It facilitates the import of predefined users, connections, and variables to simplify the deployment and initial setup of Airflow.

## Prerequisites

Before starting, ensure that Docker and Docker Compose are installed on your machine. The instructions below assume you have access to your operating system's command line.

## Initial Setup

1. **Airflow Initialization**:
   - Run the following command to initialize the database and prepare the Airflow environment:
     ```
     docker-compose run --rm airflow-init
     ```

2. **User Import**:
   - To import Airflow users from a JSON file, execute:
     ```
     docker-compose run --rm airflow-cli users import /opt/airflow/config/users.json
     ```

3. **Connection Import**:
   - To import connections from a YAML file, use the command:
     ```
     docker-compose run --rm airflow-cli connections import /opt/airflow/config/connections.yml
     ```

4. **Variable Import**:
   - To import variables from a JSON file, execute:
     ```
     docker-compose run --rm airflow-cli variables import /opt/airflow/config/variables.json
     ```

5. **Run Airflow**:
   - To start all Airflow services in daemon mode, use:
     ```
     docker-compose up -d
     ```

## Accessing Airflow

After executing the above steps, the Airflow webserver will be available on port 8080 of your localhost. You can access the Airflow web interface by navigating to `http://localhost:8080` in your browser.

## Maintenance

- **Logs**: Service logs can be monitored through Docker Compose with the command:
```
    docker-compose logs -f
```
- **Stopping Services**:
- To stop all Airflow services, execute:
  ```
  docker-compose down
  ```

## Support

For more information on how to use Apache Airflow, consult the [official Airflow documentation](https://airflow.apache.org/docs/).

---


![image](https://github.com/florestleaks/airflow/assets/139988984/8ebc35b5-52b6-4194-95dd-e4a69bfc38d6)
![image](https://github.com/florestleaks/airflow/assets/139988984/88cfb33f-e38a-4b7c-a5fd-af73d9933463)
![image](https://github.com/florestleaks/airflow/assets/139988984/f3ce55a3-a094-45a0-8cee-f3c3f153c9cc)
![image](https://github.com/florestleaks/airflow/assets/139988984/69eed04a-3074-4123-9adf-0ba2d99b80b6)
![image](https://github.com/florestleaks/airflow/assets/139988984/da89979e-1d90-4057-8071-a36346892dde)
![image](https://github.com/florestleaks/airflow/assets/139988984/86673df6-5880-4546-8c71-b333cbecaa1d)