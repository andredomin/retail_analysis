CREATE   VIEW dbo.vw_ResumenSimplePorEdad AS  
SELECT  
    CASE  
        WHEN age BETWEEN 18 AND 24 THEN '18-24'  
        WHEN age BETWEEN 25 AND 34 THEN '25-34'   
        WHEN age BETWEEN 35 AND 44 THEN '35-44'  
        WHEN age BETWEEN 45 AND 54 THEN '45-54'  
        WHEN age BETWEEN 55 AND 64 THEN '55-64'  
        WHEN age >= 65 THEN '65+'  
        WHEN age IS NULL THEN 'No Registrada'  
        ELSE 'Otros'  
    END AS grupo_edad,  
    COUNT(*) AS total_clientes,  
    SUM(price_num) AS facturacion_total,  
    AVG(price_num) AS gasto_promedio  
FROM dbo.retail_sql_clean  
WHERE price_num > 0  
GROUP BY   
    CASE  
        WHEN age BETWEEN 18 AND 24 THEN '18-24'  
        WHEN age BETWEEN 25 AND 34 THEN '25-34'  
        WHEN age BETWEEN 35 AND 44 THEN '35-44'  
        WHEN age BETWEEN 45 AND 54 THEN '45-54'  
        WHEN age BETWEEN 55 AND 64 THEN '55-64'  
        WHEN age >= 65 THEN '65+'  
        WHEN age IS NULL THEN 'No Registrada'  
        ELSE 'Otros'  
    END;