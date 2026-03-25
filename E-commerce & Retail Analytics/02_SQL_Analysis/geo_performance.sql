SELECT 
    st.name AS Territory_Name,
    st."Group" AS Region,
    CAST(SUM(soh.totaldue) AS NUMERIC(18,2)) AS Sales_Amount
FROM sales.salesorderheader AS soh
JOIN sales.salesterritory AS st ON soh.territoryid = st.territoryid
GROUP BY st.name, st."Group"
ORDER BY Sales_Amount DESC;