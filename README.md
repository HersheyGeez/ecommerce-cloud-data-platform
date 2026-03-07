![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# 📦 Ecommerce Cloud Data Platform

A cloud-native data platform built using **Snowflake** and **dbt**, designed with a layered warehouse architecture and production-oriented ELT strategy.

This project demonstrates how an ecommerce dataset can be ingested, transformed, and modeled inside a cloud data warehouse using scalable and maintainable data engineering practices.

For detailed technical documentation, architecture diagrams, data flow diagrams, and model lineage, please refer to:

👉 **[Technical Documentation](docs/README.md)**

---

## 🎯 Project Objective

The goal of this project is to design and incrementally build a modern cloud data platform that supports:

- Structured batch ingestion  
- Layered warehouse architecture (RAW → STAGING → MARTS)  
- Transformation using dbt  
- Dimensional modeling for analytics  
- Analytics-ready data foundations  

The project follows an evolution-based development approach where each architectural layer is implemented and documented progressively.

---

## 🏗 Current Implementation Scope (Version 3)

The platform currently includes:

- Snowflake database and schema setup  
- Internal staging configuration  
- Raw schema design (source-aligned tables)  
- Batch ingestion using `COPY INTO`  
- dbt-based **staging layer transformations**  
- dbt-based **marts layer implementing dimensional models**  
- Fact and dimension tables for analytics workloads  
- Model testing and structured dbt project organization  

Future versions will introduce orchestration and pipeline automation.

---

## 🧱 Architecture Overview

The system follows an **ELT architecture**:

1. Source CSV files  
2. Snowflake Internal Stage  
3. **RAW layer** (source-aligned ingestion tables)  
4. **STAGING layer** (data cleaning and standardization via dbt)  
5. **MARTS layer** (dimensional modeling with facts and dimensions)

This layered design ensures traceability, modular transformations, and scalable analytics modeling.

---

## 🛠 Technology Stack

- **Snowflake** – Cloud Data Warehouse  
- **SQL** – Warehouse modeling & ingestion  
- **dbt** – Transformation and dimensional modeling  
- **CSV Batch Files** – Source data  
- **Draw.io** – Architecture and data flow diagrams  

Planned:

- **Apache Airflow** – Workflow orchestration  
- Incremental loading strategy  
- Data quality automation  
- CI/CD for dbt workflows  

---

## 💡 Design Philosophy

This project emphasizes:

- Clear separation between ingestion, transformation, and analytics layers  
- ELT architecture leveraging Snowflake compute  
- Source-aligned RAW schema for traceability  
- Modular transformation design using dbt  
- Dimensional modeling for analytics consumption  
- Incremental system development with evolving architecture documentation  

---

## 👤 Author

Harsh Gupta  
Final Year B.Tech | Aspiring Data Engineer
