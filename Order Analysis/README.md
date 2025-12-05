# Orders Analysis (Sales Analytics Project)

A small analytics project using an `orders` dataset. The repository contains:
- `orders.csv` — raw dataset (CSV).
- `orders.ipynb` — Jupyter notebook with EDA, visualizations and analysis.
- `orders.sql` — example SQL queries to run against a SQL database (top sellers, MoM comparisons, category analysis, etc.).

## Project Overview
This project demonstrates:
- Exploratory data analysis (EDA) in Jupyter Notebook.
- SQL queries for business insights: top revenue products, regional top-sellers, month-over-month comparisons for 2022 vs 2023, best month per category, and sub-category growth analysis.

## Files
- `orders.csv` — dataset (sensitive data should be removed before publishing if present).
- `orders.ipynb` — contains data loading, cleaning steps, EDA charts and summary conclusions.
- `orders.sql` — ready-made SQL queries for a SQL engine. (Examples include top 10 revenue products, top 5 products by region, MoM growth comparisons, and category/sub-category analyses.)

## How to run
### Jupyter Notebook
1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate   # macOS/Linux
   venv\Scripts\activate      # Windows
   pip install -r requirements.txt

