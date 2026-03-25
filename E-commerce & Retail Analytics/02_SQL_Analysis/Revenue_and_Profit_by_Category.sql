SELECT 
    pc.name AS Category,
    CAST(SUM(sod.unitprice * sod.orderqty) AS NUMERIC(18,2)) AS Total_Revenue,
    CAST(SUM((sod.unitprice* sod.orderqty) - (p.standardcost * sod.orderqty)) AS NUMERIC(18,2)) AS Total_Profit,
    COUNT(DISTINCT soh.salesorderid) AS Order_Count
FROM sales.salesorderheader AS soh
JOIN sales.salesorderdetail AS sod ON soh.salesorderid = sod.salesorderid
JOIN production.product AS p ON sod.productid = p.productid
JOIN production.productsubcategory AS ps ON p.productsubcategoryid = ps.productsubcategoryid
JOIN production.productcategory AS pc ON ps.productcategoryid = pc.productcategoryid
GROUP BY pc.name
ORDER BY Total_Revenue DESC;