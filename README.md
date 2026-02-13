# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrate a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights.
Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

<hr>

## 📖 Project Overview

This project involves:
1. **Data Architecture**: Designing a modern Data Warehouse using Medallion Architecture **Bronze**, **Silver** and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming and loading data from source systems into the data warehouse.
3. **Data Modelling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL based reports and dashboards for actionable insights.

🎯 This repository is showcasing expertise in:

- SQL Development
- Data Architect
- Data Engineering
- ETL Pipeline Developer
- Data Modelling
- Data Analytics


## 📌Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source system (CRM & ERP) provided as a CSV file.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine two sources into a single, user-friendly data model designed for analytical queires.
- **Scope**: Focus on the latest dataset only; no historization required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics team.

### BI: Analytics and Reporting (Data Analytics)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with business key metrices, enabling strategic decision-making.

**:🏗 Data Architecture**

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver** and **Gold** layers:

<img width="1186" height="604" alt="image" src="https://github.com/user-attachments/assets/7263801e-df19-42f5-ac3f-ab826c6a00ad" />

1. **Bronze Layer**: Stores raw data as-in from the source systems. Data is ingested from the CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization and normalization processes to prepare data for analysis.
3. **Gold Layer**: Contained business-ready data modeled into a star schema required for reporting and analytics.

## 📁 Repository Structure

```
data-warehouse-projects/
|
|-- datasets/                         # Raw datasets used for the project (ERP and CRM data)
|
|-- docs/                             # Project documentation and architecture details
|   |-- etl.draw.io                   # draw.io file shows all different techniques and methods of ETL
|   |-- data_architecture.drawio      # draw.io file shows the project architecture
|   |-- data_catalog.md               # Catalog of datasets, including field description and metadata
|   |-- data_flow.drawio              # draw.io file for the data flow diagram
|   |-- data_models.drawio            # draw.io file for data model (star schema)
|   |-- naming_conventions.md         # Consistent naming guildlines for tables, columns and files
|
|-- scripts/                          # SQL scripts for ETL and transformations
|   |-- bronze/                       # Scripts for extracting and loading raw data
|   |-- silver/                       # Scripts for cleaning and transforming data
|   |-- gold/                         # Scripts for creating analytical models
|
|-- tests/                            # Test scripts and quality files
|
|-- readme.md                         # Project overview and instructions
|-- LICENSE                           # License information for the repository
```

-----------------------------------------------------
-----------------------------------------------------

#### License
This project is licensed under the MIT License.


