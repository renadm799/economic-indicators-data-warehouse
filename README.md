# Economic Indicators Data Warehouse

## Project Overview

This university group project explores the design of a relational data warehouse for analyzing historical economic indicators, including gold prices, oil prices, and currency exchange rates.

The project focuses on organizing economic data using a **star schema** in MySQL and applying SQL queries to explore historical patterns and compare indicators.

## Tools & Technologies

- **MySQL** – Database design and SQL analysis
- **SQL** – Table creation, joins, aggregation, and analytical queries
- **Data Warehousing** – Star schema, fact tables, and dimension tables
- **Economic Datasets** – Historical gold prices, oil prices, and exchange rates

## Database Design

The warehouse uses a star schema with four tables:

| Table | Description |
|---|---|
| `DIM_Date` | Stores year and month information |
| `DIM_Currency` | Stores currency codes and names |
| `DIM_Commodity` | Stores commodity information |
| `FACT_Economic_Indicators` | Stores economic indicator values and dimension references |

## SQL Analysis

The SQL script includes queries to:

1. Calculate average gold prices by year.
2. Calculate average oil prices by year.
3. Compare gold prices and exchange rates across years.
4. Analyze average, minimum, and maximum oil prices by month.

The project also includes SQL queries for checking table records and joining fact and dimension tables.

## My Contribution

As part of the university project team, I contributed to:

- Designing and implementing the data warehouse schema in MySQL.
- Creating fact and dimension tables with primary and foreign keys.
- Writing SQL queries to validate and explore warehouse records.
- Developing analytical SQL queries using `JOIN`, `GROUP BY`, `AVG`, `MIN`, and `MAX`.

## Datasets

The project used historical economic datasets from publicly available sources.

- [Historical Gold Prices – Kaggle](https://www.kaggle.com/datasets/jishnukoliyadan/gold-price-1979-present)
- [Exchange Rates – Kaggle](https://www.kaggle.com/datasets/federalreserve/exchange-rates)
- Oil Prices – BP Statistics (2016), dataset source to be confirmed.

## Repository Contents

- `data_integration.sql` – Original SQL code for database structure, validation, and analysis.
- `project_presentation.pdf` – University group project presentation.
- `README.md` – Project documentation.

**Implementation note:** The SQL script contains the warehouse schema and analytical queries. The complete CSV extraction, transformation, and loading process is not included in this repository.

## Project Context

This project was completed as part of university coursework in a team setting. The repository highlights my contributions to database design and SQL-based economic data analysis.
