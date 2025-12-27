##Brazilian E-Commerce Data Analysis (Olist Dataset)

##Project Overview
This project performs an end-to-end analysis of Brazilian e-commerce data using the Olist dataset.
The objective is to extract meaningful business insights related to sales performance, customer behavior, delivery efficiency, and customer satisfaction by using Python, SQL, and Power BI.

##Objectives

Analyze revenue and order trends over time

Understand customer purchasing behavior

Evaluate delivery performance and its impact on customer reviews

Build an interactive dashboard for business decision-making

##Dataset
Source: Brazilian E-Commerce Public Dataset (Olist)
Approximate size: 100,000 orders

##Key tables used:

Orders

Order Payments

Order Items

Customers

Products

Reviews

##Tech Stack

Python: Pandas, NumPy, Matplotlib, Seaborn

SQL: PostgreSQL

BI Tool: Power BI

Other Tools: Jupyter Notebook, Power Query, DAX

##Project Workflow

Data Cleaning and Feature Engineering (Python)

Merged multiple relational tables into a single analytical dataset

Handled missing values and inconsistent timestamps

Converted columns to appropriate data types

Created derived features such as delivery_time_days and customer_type (new vs repeat customers)

Exploratory Data Analysis (EDA)

Analyzed revenue trends over time

Studied distribution of review scores

Evaluated delivery time impact on customer satisfaction

Identified top-performing product categories

Analyzed payment methods

EDA was performed in a separate notebook for modularity and clarity.

Data Storage and SQL Analysis (PostgreSQL)

Loaded the cleaned dataset into PostgreSQL using Python

Fixed schema issues such as incorrect data types

Converted text columns to timestamps for date analysis

Converted floating-point monetary values to numeric types

Wrote SQL queries to analyze monthly revenue, delivery performance, customer behavior, and category-wise sales

Power BI Dashboard

Connected Power BI to PostgreSQL using Import connectivity mode

Fixed column data types using Power Query

Created reusable DAX measures for KPIs

Built an interactive dashboard with slicers

Dashboard sections include:

##Executive Summary

Sales and Product Performance

Customer and Delivery Analysis

##Key Insights

Revenue shows seasonal trends with noticeable peaks

A small number of product categories generate most of the revenue

Credit cards are the most frequently used payment method

Faster deliveries are associated with higher customer review scores

Majority of customers are first-time buyers

##Power BI Measures

Total Revenue

Total Orders

Average Order Value (AOV)

Average Delivery Time

Revenue by Product Category

Skills Demonstrated

Data cleaning and transformation

SQL querying and schema debugging

Business-focused data analysis

Power BI dashboard development

DAX measure creation

Data storytelling

##Business Impact
This analysis helps e-commerce stakeholders understand sales trends, improve delivery operations, identify high-performing categories, and enhance customer satisfaction through data-driven insights.

##How to Run the Project

Clone the repository

Run Python notebooks for data cleaning and EDA

Load the processed data into PostgreSQL

Connect Power BI to PostgreSQL

Refresh the data and explore the dashboard

##Author
Name: Thiyanesh
Role: Aspiring Data Analyst
Skills: Python, SQL, Power BI, Data Analysis

Final Note
This project demonstrates a complete real-world data analyst workflow, from raw data processing to business insights and dashboard visualization.
