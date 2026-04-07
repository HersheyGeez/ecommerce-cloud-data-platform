![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# 📦 Ecommerce Cloud Data Platform

A cloud-native data platform built using **AWS S3, Snowflake, dbt, and Apache Airflow**, designed with a layered lakehouse-style architecture and production-oriented ELT strategy.

This project demonstrates how an ecommerce dataset can be ingested into a data lake, loaded into a cloud data warehouse, transformed, modeled, and orchestrated using modern data engineering practices.

For detailed technical documentation, architecture diagrams, data flow diagrams, and model lineage, please refer to:

👉 **[Technical Documentation](docs/README.md)**

---

## 🎯 Project Objective

The goal of this project is to design and incrementally build a modern cloud data platform that supports:

- Data lake storage using AWS S3  
- Structured batch ingestion  
- Layered warehouse architecture (RAW → STAGING → MARTS)  
- Transformation using dbt  
- Dimensional modeling for analytics  
- Workflow orchestration using Airflow  
- Analytics-ready data foundations  

The project follows an evolution-based development approach where each architectural layer is implemented and documented progressively.

---

## 🏗 Current Implementation Scope (Version 5)

The platform currently includes:

- **AWS S3 bucket as data lake for raw file storage**  
- Snowflake database and schema setup  
- Integration between S3 and Snowflake (external/internal staging)  
- Raw schema design (source-aligned tables)  
- Batch ingestion using `COPY INTO`  
- dbt-based **staging layer transformations**  
- dbt-based **marts layer implementing dimensional models**  
- Fact and dimension tables for analytics workloads  
- **Apache Airflow DAG for end-to-end pipeline orchestration**  
- Automated pipeline execution (S3 → Snowflake → dbt → marts)  
- Model testing and structured project organization  

---

## 🧱 Architecture Overview

The system follows a **modern lakehouse-style ELT architecture**:

1. **AWS S3 (Data Lake)** – stores raw CSV files  
2. Snowflake staging layer (external/internal stage)  
3. **RAW layer** (source-aligned ingestion tables)  
4. **STAGING layer** (data cleaning and standardization via dbt)  
5. **MARTS layer** (dimensional modeling with facts and dimensions)  
6. **Orchestration layer** (Airflow DAG managing pipeline execution)

This layered design ensures scalability, traceability, and separation of storage and compute.

---

## 🛠 Technology Stack

- **AWS S3** – Data Lake storage  
- **Snowflake** – Cloud Data Warehouse  
- **SQL** – Warehouse modeling & ingestion  
- **dbt** – Transformation and dimensional modeling  
- **Apache Airflow** – Workflow orchestration  
- **Python** – DAG development  
- **CSV Batch Files** – Source data  
- **Draw.io** – Architecture and data flow diagrams  

---

## 💡 Design Philosophy

This project emphasizes:

- Separation of storage (S3) and compute (Snowflake)  
- ELT architecture leveraging warehouse compute  
- Source-aligned RAW schema for traceability  
- Modular transformation design using dbt  
- Dimensional modeling for analytics consumption  
- Workflow orchestration for automation and reliability  
- Evolution-based system development  

---

## 👤 Author

Harsh Gupta  
Final Year B.Tech | Aspiring Data Engineer
