# SQL Analysis & Data Modeling

This directory contains the core analytical logic of the project. It documents the transition from raw transactional tables to a **Denormalized Reporting Layer** optimized for Business Intelligence.

---

## Data Architecture Strategy

The analytical approach follows the logic:
1. **Raw:** Direct access to `sales` and `production` schemas.
2. **Transformation:** Application of business logic (Casting, Calculating Profit).
3. **Reporting:** The creation of a **Unified View** (`vw_sales_performance`) that serves as the Single Source of Truth for Power BI.

### The Reporting View Logic
To minimize technical debt and improve Power BI performance, a comprehensive view was developed to consolidate 5 different tables:



```sql
-- Logic behind the Unified View:
-- 1. Truncate Timestamps to DATE for time-series consistency.
-- 2. Calculate Gross Profit: (UnitPrice * Qty) - (StandardCost * Qty).
-- 3. Standardize naming conventions for international reporting.