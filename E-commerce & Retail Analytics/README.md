# Case Study: AdventureWorks Sales Performance (PostgreSQL + Power BI)
> **Domain:** E-commerce & Retail Analytics  
> **Technical Focus:** SQL Schema Migration, Data Modeling & Financial KPI Analysis

---

## 📊 Business Logic & SQL Performance

In this phase, I translated business requirements into optimized SQL queries. To ensure the database remains the "Single Source of Truth," I developed complex views instead of performing raw data manipulation in the visualization layer.

### 1. Key Business Metrics (KPIs)
I focused on three main pillars to evaluate the company's health:
* **Total Revenue:** Calculated as `UnitPrice * OrderQty` to ensure real-time accuracy.
* **Gross Profit:** Derived by subtracting `StandardCost` from total sales to measure actual earnings.
* **Profit Margin:** Used to identify the most efficient product categories.

### 2. High-Performance SQL Implementation
The following query aggregates **31,000+ sales records** to provide an executive summary by category:

```sql
SELECT 
    pc.name AS Category,
    CAST(SUM(sod.unitprice * sod.orderqty) AS NUMERIC(18,2)) AS Total_Revenue,
    CAST(SUM((sod.unitprice * sod.orderqty) - (p.standardcost * sod.orderqty)) AS NUMERIC(18,2)) AS Total_Profit,
    COUNT(DISTINCT soh.salesorderid) AS Order_Count
FROM sales.salesorderheader AS soh
JOIN sales.salesorderdetail AS sod ON soh.salesorderid = sod.salesorderid
JOIN production.product AS p ON sod.productid = p.productid
JOIN production.productsubcategory AS ps ON p.productsubcategoryid = ps.productsubcategoryid
JOIN production.productcategory AS pc ON ps.productcategoryid = pc.productcategoryid
GROUP BY pc.name
ORDER BY Total_Revenue DESC;