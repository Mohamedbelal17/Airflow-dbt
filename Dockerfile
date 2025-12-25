FROM apache/airflow:2.9.3

# Switch to airflow user (required)
USER airflow

# Install dbt-snowflake
RUN pip install --no-cache-dir dbt-snowflake==1.7.0
