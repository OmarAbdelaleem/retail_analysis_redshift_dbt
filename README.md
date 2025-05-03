# 🚀 Retail Analytics Pipeline with Redshift & dbt

**An end-to-end data engineering solution** for retail analytics, powered by **Amazon Redshift**, **dbt (data build tool)**, and a **star schema** design. This project transforms raw retail data into actionable insights with optimized performance and data quality checks.


## 🔧 Tech Stack
- **Data Warehouse**: Amazon Redshift
- **Transformation**: dbt cloud (SQL-based modeling)
- **Orchestration**: Airflow (optional)
- **BI Visualization**: Metabase/Tableau
- **Data Modeling**: Star Schema

## 🌟 Key Features
✅ **End-to-End Pipeline**: Raw data → Redshift → dbt → Dashboards  
✅ **Star Schema Design**: Optimized for analytics performance  
✅ **Modular dbt Code**: Staging → Intermediate → Mart layers  
✅ **Data Quality**: Built-in dbt tests for validation  
✅ **Documentation**: Self-documented data lineage  


## 🛠️ Setup Guide

### 1. Prerequisites
- Amazon Redshift cluster
- dbt Cloud or CLI (`pip install dbt-redshift`)
- Sample retail dataset (CSV/API)

### 2. Deploy the Pipeline
```bash
# Clone repo
git clone https://github.com/OmarAbdelaleem/retail_analysis_redshift_dbt.git

# Install dependencies
pip install -r requirements.txt

# Run dbt
dbt run --models staging   # First load staging models
dbt run --models marts    # Build star schema
-- models/marts/fact_sales.sql
{{ 
  config(
    materialized='table',
    sort='sales_date'
  )
}}

SELECT
  s.sale_id,
  c.customer_id,
  p.product_id,
  st.store_id,
  t.date_id,
  s.quantity,
  s.revenue
FROM {{ ref('stg_sales') }} s
JOIN {{ ref('dim_customer') }} c ON s.customer_id = c.customer_id
JOIN {{ ref('dim_product') }} p ON s.product_id = p.product_id
JOIN {{ ref('dim_store') }} st ON s.store_id = st.store_id
JOIN {{ ref('dim_time') }} t ON s.sale_date = t.full_date
```
