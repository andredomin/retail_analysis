CREATE   VIEW dbo.vw_PreciosPorCategorias AS  
WITH DatosLimpios AS (  
    SELECT   
        category,  
          
        CASE   
            WHEN TRY_CAST(price AS DECIMAL(10,2)) IS NOT NULL   
            THEN TRY_CAST(price AS DECIMAL(10,2))  
            ELSE NULL   
        END AS price_numerico  
    FROM dbo.retail_sql_clean  
)  
SELECT  
    category,  
    COUNT(*) AS cantidad_productos,  
    MAX(price_numerico) AS precio_maximo,  
    MIN(price_numerico) AS precio_minimo,  
    AVG(price_numerico) AS precio_promedio,  
    SUM(price_numerico) AS valor_total_inventario  
FROM DatosLimpios  
WHERE price_numerico IS NOT NULL  
GROUP BY category;  
  
  
  
  
  
  
  
  
  
  
  
  
  
  