# Data-Warehousing-Capstone-Project
The project aims to perform Analytical Data Engineering by ingesting data from various sources, loading it into the Snowflake data warehouse, and preparing it for Business Intelligence (BI) usage with the help of the Metabase too
# 1. Project Architecture
The project is divided into three main parts: data ingestion, data transformation, and data analysis/dashboard.
![Data-Warehousing-Project](https://github.com/idmaram/Data-Warehousing-Project/assets/160900371/31ea2e71-15c3-4628-aceb-5712f0d5e504)
# 2. About Data
The dataset originates from TPCDS, a well-known dataset designed for database testing, with a specific emphasis on Retail Sales. It encompasses sales records from both websites and catalogs, along with detailed information on inventory levels for each item within every warehouse. Moreover, it incorporates 15 dimensional tables containing valuable information about customers, warehouses, items, and more.
The dataset is divided into two parts:
RDS: All tables, except for the inventory tables, are stored in the Postgres DB in AWS RDS. These tables are refreshed every day with the latest sales data, requiring daily ETL processes.

S3 Bucket: The single Inventory table is stored in a S3 bucket. Each day, a new file containing the most recent data is deposited into the S3 bucket.
