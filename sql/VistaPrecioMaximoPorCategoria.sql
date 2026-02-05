CREATE   VIEW dbo.vw_PrecioMaximoPorCategoria AS  
SELECT  
    category,  
    CAST(MAX(price) AS DECIMAL(10,2)) AS precio_maximo  
  
FROM dbo.retail_sql_clean  
GROUP BY category;  
  
  
  
  
  
  
  
  
   
  
  
  
  
  
  
  
  
  
  
  
  
  