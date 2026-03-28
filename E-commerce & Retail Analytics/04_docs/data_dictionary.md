# Data Dictionary: AdventureWorks Sales Analytics

## Overview
This document describes the structure of the main tables and key columns used in the data modeling for the sales and profitability analysis of the AdventureWorks project. The database follows a relational structure organized into schemas (`sales`, `production`).

---

## Schema: Sales

### Table: `sales.salesorderheader`
Stores header-level or general transaction information. Each row represents a unique purchase order.

| Column | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `SalesOrderID` | INT | PK | Unique identifier for the purchase order. |
| `OrderDate` | DATE | - | Date the customer made the purchase. Used for Time Intelligence calculations. |
| `CustomerID` | INT | FK | Unique identifier of the customer who made the purchase. |
| `TerritoryID` | INT | FK | Identifier for the geographic region where the sale occurred. |
| `SubTotal` | NUMERIC | - | Sale subtotal before taxes and freight. |

### Table: `sales.salesorderdetail`
Contains line-item level granularity. Each row represents a specific product within a purchase order.

| Column | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `SalesOrderID` | INT | FK | Links the item to its main purchase order (`salesorderheader`). |
| `SalesOrderDetailID`| INT | PK | Unique identifier for the item within the order. |
| `ProductID` | INT | FK | Identifier of the purchased product. |
| `OrderQty` | INT | - | Number of units purchased for that specific product. |
| `UnitPrice` | NUMERIC | - | Retail price per unit at the time of the transaction. |

---

## 🚲 Schema: Production (Catalog)

### Table: `production.product`
The master catalog of all company items (SKUs).

| Column | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `ProductID` | INT | PK | Unique identifier for the product. |
| `Name` | VARCHAR | - | Commercial name of the product (e.g., *Mountain-200 Black, 38*). |
| `StandardCost` | NUMERIC | - | Standard manufacturing or acquisition cost. **Crucial for calculating Net Profit.** |
| `ProductSubcategoryID`| INT | FK | Links the product to its corresponding subcategory. |

### Table: `production.productsubcategory`
Secondary classification of products (e.g., *Mountain Bikes*, *Road Bikes*).

| Column | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `ProductSubcategoryID`| INT | PK | Unique identifier for the subcategory. |
| `ProductCategoryID` | INT | FK | Links the subcategory to the main category or "family". |
| `Name` | VARCHAR | - | Name of the subcategory. |

### Table: `production.productcategory`
The highest hierarchy or "family" of products. It is the primary grouping level in the dashboards.

| Column | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `ProductCategoryID` | INT | PK | Unique identifier for the category. |
| `Name` | VARCHAR | - | Name of the main category (e.g., *Bikes*, *Accessories*, *Clothing*, *Components*). |

---

## Calculated Metrics (DAX / SQL Views)
These metrics do not exist as static columns in the database; they are derived mathematically in the SQL views layer or as DAX measures in Power BI.

* **Total Revenue:** `SUM(OrderQty * UnitPrice)`
* **Total Cost:** `SUM(OrderQty * StandardCost)`
* **Total Profit:** `Total Revenue - Total Cost`
* **Profit Margin:** `Total Profit / Total Revenue`