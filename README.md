# Business Intelligence & Data Analytics Portfolio

## About
This repository contains my Business Intelligence and Data Analytics portfolio, focused on turning raw database records into strategic, actionable business insights. The work here covers the full end-to-end analytical workflow: from SQL data extraction and transformation to DAX modeling and advanced Power BI visualization.

My core philosophy is that dashboards should not just display numbers; they must solve business problems, identify revenue leaks, and drive decision-making.

---

## Tech

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=microsoftpowerbi&logoColor=black)
![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![VirtualBox](https://img.shields.io/badge/VirtualBox-214478?style=for-the-badge&logo=virtualbox&logoColor=white)

---

## What you will find here
Each project in this repository includes:
- **Data Engineering:** SQL scripts for data cleaning, type casting, and view creation.
- **Data Modeling:** Relational model design optimized for performance.
- **Analytical Logic:** DAX measures handling filter contexts and time intelligence.
- **Data Storytelling:** Dashboards designed with UI/UX best practices for executive scanning.
- **Business Insights:** Translation of visual trends into strategic recommendations.

---

## Tools and Technologies
- **Power BI:** Data modeling, advanced DAX (Variables, Context manipulation), Conditional Formatting.
- **SQL (PostgreSQL / SQL Server):** Data extraction, cleaning (e.g., Date casting), and analytical views.
- **Data Architecture:** Relational database querying and star-schema principles.

---

## Featured Projects

### 1. AdventureWorks: Executive Sales & Profitability Dashboard
An end-to-end Business Intelligence solution analyzing over $100M+ in global sales data to evaluate market health, product efficiency, and geographical growth.

**Focus Areas & Technical Implementations:**
- **Volume vs. Profitability Analysis:** Developed dual-axis logic to distinguish between gross revenue and net profit. Implemented a *Top N Dynamic Filter* with conditional formatting (Red/Green) to instantly flag "False Heroes" (high-volume products with negative profit margins).
- **Time Intelligence & KPIs:** Engineered custom DAX measures using `VAR`, `CALCULATE`, and filter overrides to track Year-over-Year (YoY) and Month-over-Month (MoM) performance against baseline targets, avoiding the pitfalls of standard auto-date functions.
- **Geospatial & Category Tracking:** Designed cross-filtered visual grids (Maps and Treemaps) allowing stakeholders to drill down into specific regional performances, revealing high-yield markets like Australia.
- **Executive UI/UX:** Applied the "F-Pattern" layout for readability, utilizing high-visibility KPI cards for absolute metrics and isolating complex trends into intuitive scatter and line charts.

**Key Business Insight:**
Revenue volume does not equal business health. The dashboard successfully highlighted that while the "Bikes" category drove top-line revenue, specific SKUs in the "Clothing" segment generated high sales volume but operated at a deficit, indicating a need for urgent pricing or logistical adjustments.

---

## Approach
My analytical projects follow a consistent, business-first approach:
1. **Understand the Business Question:** Define what stakeholders need to know (e.g., "Are we actually making money on our top-selling items?").
2. **Data Preparation (SQL):** Clean and structure data at the source to ensure Power BI performance.
3. **Modeling & DAX:** Build resilient measures that adapt to complex user filtering.
4. **Visual Design:** Prioritize cognitive ease, removing visual noise and using color strategically (Exception Reporting).
5. **Insight Generation:** Deliver clear, data-backed recommendations.

---

## Skills Demonstrated
- **SQL:** Querying, Views, Data Cleansing.
- **Power BI DAX:** `CALCULATE`, `DIVIDE`, `VAR`, `MAX`, `REMOVEFILTERS`.
- **Data Visualization:** Exception Reporting, Scatter Plots, Geographic mapping, Dynamic Tooltips.
- **Business Acumen:** Translating technical data points into Profit & Loss (P&L) realities.

---

## Notes
The datasets used (such as the AdventureWorks sample database) are utilized to demonstrate the analytical process, the clarity of the data model, and the ability to extract executive-level insights from raw transactional systems.