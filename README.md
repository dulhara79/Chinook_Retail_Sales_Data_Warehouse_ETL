# Chinook_Retail_Sales_Data_Warehouse_ETL

This project demonstrates the creation of a complete ETL pipeline using **SQL Server Integration Services (SSIS)** to move data from a retail transactional database into a **star schema data warehouse**. This solution serves as the backend for business intelligence and analytics using tools like Power BI and SSAS.

---

## 🧠 Project Objectives

- Design a **data warehouse** in a star schema.
- Implement **ETL pipelines** using **SSIS** to extract data from source systems.
- Clean and transform data in a **staging area**.
- Load structured data into **dimension and fact tables**.
- Prepare data for **OLAP** and future **Power BI dashboards**.

---

## 🧱 Architecture Overview

- **Source DB** ➝ **Staging DB** ➝ **Data Warehouse**
- ETL Process built using **SSIS Control Flow** and **Data Flow**
- Dimensions include: Date, Customer, Product, Store
- Fact table: Sales transactions with measures like SalesAmount, Quantity, Profit

---

## 📁 Project Structure

Retail_Sales_Data_Warehouse_ETL/
│
├── cripts/
| ├── update_procedures
|     ├── UpdateDimArtist.sql
|     └── UpdateDimTrack.sql
| ├── warehouse
│   ├── CreateDimArtist.sql
│   ├── CreateDimCustomer.sql
│   ├── CreateDimDate.sql
|   ├── CreateDimEmployee.sql
|   ├── CreateDimTrack.sql
│   └── CreateFactSales.sql
│
├── SSIS_Packages/
│ ├── Chinook_Load_DW.dtsx
│ ├── Chinook_Load_Staging.dtsx
│ └── ChinookETL.sln
---

## 🛠️ Technologies Used

- SQL Server 2019
- SSIS (SQL Server Integration Services)
- SQL Server Management Studio (SSMS)
- Star Schema Design
- T-SQL

---

## 🔍 Key Features

- **Clean & Modular ETL**: Each step is clearly separated (Extract, Transform, Load).
- **Error Handling & Logging**: (optional - if implemented).
- **Scalable Warehouse**: Easily extendable for more dimensions and facts.
- **BI-Ready**: Structured for direct use in Power BI and SSAS.

---

## 📈 Future Extensions

- Build Power BI dashboards with drill-down and drill-through.
- Deploy SSAS cube using this warehouse.
- Automate SSIS packages using SQL Server Agent.

---
