# 🚀 Snowflake ELT Pipeline with dbt & Apache Airflow

> A modern ELT data pipeline using **Snowflake**, **dbt**, **Apache Airflow**, and **Docker**

---

## 🧠 Overview

This project demonstrates a **modern ELT architecture** where raw banking data is ingested into **Snowflake**, transformed using **dbt**, and orchestrated using **Apache Airflow**, all running in a **Dockerized environment**.

The pipeline builds **dimensional models (Fact & Dimension tables)** and enforces **data quality checks** using dbt tests.

---

## 🏗️ Architecture

```text
CSV Files (Seeds)
        |
        v
Snowflake (RAW schema)
        |
        v
dbt Transformations
(Dimension & Fact Models)
        |
        v
Snowflake (MARTS schema)
        |
        v
Apache Airflow (Dockerized)
```
## 🧰 Tech Stack

| Category | Technology |
|--------|------------|
| Data Warehouse | Snowflake |
| Transformations | dbt |
| Orchestration | Apache Airflow |
| Containerization | Docker |
| Programming Language | Python, SQL |
| Data Source | CSV |

---

## 🐍 Python Environment Setup

A Python virtual environment is required to run and validate the code locally.

### Create Virtual Environment
```bash
python -m venv venv
```
## ⏱️ Apache Airflow Orchestration

Apache Airflow is used to orchestrate the ELT pipeline and manage task dependencies.

### DAG Name
`load_csv_dag`

### Workflow Steps
1. Check CSV file availability
2. Run `dbt seed` to load raw data
3. Run `dbt run` to create transformation models
4. Run `dbt test` to validate data quality

### Task Dependency
```python
check_csv_task >> create_data_mart
```
## 🐳 Docker Setup

Docker is used to provide a **consistent and reproducible environment** for running Apache Airflow with dbt and Snowflake.

### Dockerfile
```dockerfile
FROM apache/airflow:2.9.3

USER airflow

RUN pip install --no-cache-dir dbt-snowflake==1.7.0
```
## 🚀 Future Implementations

The following enhancements can be implemented to improve scalability, reliability, and production readiness:

- 🔄 **Incremental dbt Models**  
  Optimize performance by processing only new or changed data.

- 🕒 **Slowly Changing Dimensions (SCD)**  
  Track historical changes in dimension tables (Type 1 / Type 2).

- 📸 **dbt Snapshots**  
  Capture and manage data changes over time for auditability.

- 📊 **Monitoring & Alerting**  
  Integrate email or Slack alerts for pipeline failures and data quality issues.

- 🔁 **CI/CD Integration**  
  Automate testing and deployment using GitHub Actions or similar tools.

- 🔐 **Environment Separation**  
  Configure dev, staging, and production environments.

- ⚡ **Performance Optimization**  
  Use clustering, partitioning, and query optimization in Snowflake.

- 📘 **dbt Documentation Site**  
  Generate and publish documentation using `dbt docs generate`.

---
> Created by **Mohamed Belal** — Data Engineer

