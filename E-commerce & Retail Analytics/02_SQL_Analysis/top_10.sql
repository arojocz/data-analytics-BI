SELECT 
    p.name AS Product_Name,
    pc.name AS Category,
    CAST(SUM(sod.unitprice * sod.orderqty) AS NUMERIC(18,2)) AS Revenue
FROM sales.salesorderdetail AS sod
JOIN production.product AS p ON sod.productid = p.productid
JOIN production.productsubcategory AS ps ON p.productsubcategoryid = ps.productsubcategoryid
JOIN production.productcategory AS pc ON ps.productcategoryid = pc.productcategoryid
GROUP BY p.name, pc.name
ORDER BY Revenue DESC
LIMIT 10;