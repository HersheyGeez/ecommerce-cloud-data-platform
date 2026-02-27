# 📦 Ecommerce Cloud Data Platform

A cloud-native data warehouse project built using Snowflake, designed with a layered architecture and production-oriented ingestion strategy.

This repository demonstrates how an ecommerce dataset can be structured inside a cloud data warehouse using scalable and maintainable engineering practices.

For technical documentation, high level architecture, data flow diagram please refer to `docs/README.md`

---

## 🎯 Project Objective

The goal of this project is to design and incrementally build a modern cloud data platform that supports:

- Structured batch ingestion
- Layered warehouse architecture
- Future-ready transformation modeling
- Analytics-ready data foundations

The project follows an evolution-based development approach, where each layer is implemented and documented progressively.

---

## 🏗 Current Implementation Scope (Version 1)

Version 1 includes:

- Snowflake database and schema setup
- Internal staging configuration
- Raw schema design (source-aligned tables)
- Batch ingestion using `COPY INTO`
- Structured repository organization

Future versions will introduce transformation layers and orchestration components.

---

## 🛠 Technology Stack

- **Snowflake** – Cloud Data Warehouse  
- **SQL** – Warehouse modeling & ingestion  
- **CSV Batch Files** – Source data  
- **Draw.io** – Architecture design  

Planned:
- dbt – Transformation layer  
- Apache Airflow – Workflow orchestration

## 👤 Author

Harsh Gupta  
Final Year B.Tech | Aspiring Data Engineer
