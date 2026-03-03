![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# 📦 Ecommerce Cloud Data Platform

A cloud-native data platform built using Snowflake and dbt, designed with a layered warehouse architecture and production-oriented ELT strategy.

This project demonstrates how an ecommerce dataset can be ingested, transformed, and structured inside a cloud data warehouse using scalable and maintainable data engineering practices.

For detailed technical documentation, architecture diagrams, and data flow explanation, please refer to:

👉 **[Technical Documentation](docs/README.md)**

---

## 🎯 Project Objective

The goal of this project is to design and incrementally build a modern cloud data platform that supports:

- Structured batch ingestion  
- Layered warehouse architecture (RAW → STAGING → MARTS)  
- Transformation using dbt  
- Analytics-ready data foundations  

The project follows an evolution-based development approach, where each layer is implemented and documented progressively.

---

## 🏗 Current Implementation Scope (Version 2)

The platform currently includes:

- Snowflake database and schema setup  
- Internal staging configuration  
- Raw schema design (source-aligned tables)  
- Batch ingestion using `COPY INTO`  
- dbt-based **staging layer implementation**  
- Data standardization and transformation logic  
- Testing and model structuring within dbt  

Future versions will introduce the marts layer and workflow orchestration.

---

## 🧱 Architecture Overview

The system follows an ELT architecture:

1. Source CSV files  
2. Snowflake Internal Stage  
3. RAW layer (source-aligned tables)  
4. STAGING layer (dbt transformations & standardization)  
5. MARTS layer (planned)  

This layered approach ensures auditability, modular transformations, and scalability.

---

## 🛠 Technology Stack

- **Snowflake** – Cloud Data Warehouse  
- **SQL** – Warehouse modeling & ingestion  
- **dbt** – Transformation layer  
- **CSV Batch Files** – Source data  
- **Draw.io** – Architecture design  

Planned:
- Apache Airflow – Workflow orchestration  
- Incremental loading strategy  
- Data quality automation  

---

## 💡 Design Philosophy

This project emphasizes:

- Clean separation of layers  
- ELT approach (compute handled in Snowflake)  
- Auditability through source-aligned raw schema  
- Modular transformation design using dbt  
- Evolution-based system development  

---

## 👤 Author

Harsh Gupta  
Final Year B.Tech | Aspiring Data Engineer
