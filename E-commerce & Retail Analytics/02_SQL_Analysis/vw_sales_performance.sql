-- View for PowerBI
CREATE OR REPLACE VIEW sales.vw_sales_performance AS
SELECT 
    soh.salesorderid AS order_id,
    soh.orderdate::DATE AS order_date,
    p.name AS product_name,
    pc.name AS category,
    ps.name AS subcategory,
    st.name AS territory,
    st."group" AS region,
    sod.orderqty AS quantity,
    CAST(sod.unitprice AS NUMERIC(18,2)) AS unit_price,
    CAST(sod.unitprice * sod.orderqty AS NUMERIC(18,2)) AS total_revenue,
    CAST((sod.unitprice * sod.orderqty) - (p.standardcost * sod.orderqty) AS NUMERIC(18,2)) AS total_profit
FROM sales.salesorderheader AS soh
JOIN sales.salesorderdetail AS sod 
	ON soh.salesorderid = sod.salesorderid
JOIN production.product AS p 
	ON sod.productid = p.productid
JOIN production.productsubcategory AS ps 
	ON p.productsubcategoryid = ps.productsubcategoryid
JOIN production.productcategory AS pc 
	ON ps.productcategoryid = pc.productcategoryid
JOIN sales.salesterritory AS st 
	ON soh.territoryid = st.territoryid;