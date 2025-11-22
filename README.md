# End-to-End E-commerce Analytics Pipeline Using BigQuery & Looker Studio

This project builds a complete analytics pipeline for an e-commerce
business using Google BigQuery (for data modeling) and Looker Studio
(for visualization). It includes raw data ingestion, SQL-based
transformation models, analytical data marts, cohort analysis, and
product performance metrics --- all inside a fully documented,
reproducible ELT workflow.

## Project Overview

The objective of this project is to showcase a production-style
analytics stack: - Raw data imported into BigQuery - SQL transformation
layer with cleaned, enriched, analytical tables - Business-friendly data
marts - Looker Studio dashboard for KPIs and insights - Organized,
scalable SQL workflow

This project highlights SQL modeling, data warehousing, metric design,
and dashboard development.

## Architecture

CSV Upload → BigQuery Raw Layer → SQL Transformations → Analytics Layer
→ Looker Studio Dashboard


### Raw Layer (`raw_data` dataset)
Contains unprocessed tables:
- customers_raw  
- orders_raw  
- order_items_raw  
- products_raw  

### Transformation Layer (`analytics` dataset)
Contains cleaned, enriched tables:
- customer_cohorts  
- product_performance  
- daily_metrics (optional)

### Looker Studio Dashboard
[Interactive dashboard connected directly to BigQuery.
](https://lookerstudio.google.com/reporting/ca42842e-7e5a-4f55-96df-a8b52e247375)

## Repository Structure

```
create_customer_cohorts.sql
create_product_performance.sql
create_daily_metrics.sql
README.md
```

## Reproduce This Project

### Step 1 — Create BigQuery Project
Use your GCP project ID: ecommerce-analytics-12345

### Step 2 — Create Datasets

-raw_data

-analytics

### Step 3 — Generate Synthetic Data (No CSV Required)
Run the SQL scripts in `/data_generation/`:

1. `create_raw_tables.sql` — Creates empty raw tables  
2. `generate_customers.sql` — Creates 1,000 synthetic customers  
3. `generate_products.sql` — Creates a clean 5-product catalog  
4. `generate_orders.sql` — Generates 10,000 synthetic orders  
5. `generate_order_items.sql` — Generates realistic order items  

### Step 4 — Build Analytics Tables
Run SQL in:
- `create_customer_cohorts.sql`
- `create_product_performance.sql`
- `create_daily_metrics.sql`

### Step 5 — Build Looker Studio Dashboard
- Connect BigQuery tables  
- Create Visualizations  
- Publish the dashboard  


