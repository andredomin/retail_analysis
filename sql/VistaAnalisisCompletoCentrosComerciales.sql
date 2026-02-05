CREATE   VIEW dbo.VistaAnalisisCompletoCentrosComerciales  
AS  
  
WITH DatosLimpios AS (  
    SELECT  
        shopping_mall,  
        price_num,  
        category,  
          
        CASE   
            WHEN TRY_CAST(quantity AS DECIMAL(10,2)) IS NOT NULL   
            THEN TRY_CAST(quantity AS DECIMAL(10,2))  
            ELSE 0   
        END AS quantity_num  
    FROM retail_sql_clean  
    WHERE price_num > 0  
)  
SELECT  
    shopping_mall,  
    SUM(price_num) AS facturacion_total,  
    COUNT(*) AS total_transacciones,  
     
    SUM(quantity_num) AS total_unidades_vendidas,  
      
     
    AVG(price_num) AS ticket_medio,  
      
      
      
    CASE   
        WHEN SUM(quantity_num) > 0   
        THEN SUM(price_num) / SUM(quantity_num)   
        ELSE 0   
    END AS valor_medio_por_unidad,  
      
      
    SUM(CASE WHEN quantity_num = 1 THEN 1 ELSE 0 END) AS transacciones_de_1_unidad,  
    COUNT(DISTINCT category) AS categorias_distintas_vendidas  
      
FROM DatosLimpios  
GROUP BY shopping_mall;