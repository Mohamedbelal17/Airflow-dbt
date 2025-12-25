from airflow import DAG
from datetime import datetime
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

def check_csv():
    csv_path = "/opt/airflow/snowflake_data/seeds/Comprehensive_Banking_Database.csv"
    try:
        with open(csv_path, "r") as f:
            lines = f.readlines()
            print(f"CSV file has {len(lines)} lines.")
    except Exception as e:
        print(f"Error reading CSV file: {e}")

dag = DAG(
    dag_id="load_csv_dag",
    start_date=datetime(2025, 12, 2),
    schedule_interval="@daily",
    catchup=False
)

check_csv_task = PythonOperator(
    task_id='check_csv',
    python_callable=check_csv,
    dag=dag
)

create_data_mart = BashOperator(
    task_id='create_data_mart',
    bash_command="""
        cd /opt/airflow/snowflake_data/ &&
        dbt seed &&
        dbt run  &&
        dbt test 
    """,
    dag=dag
)

check_csv_task >> create_data_mart


