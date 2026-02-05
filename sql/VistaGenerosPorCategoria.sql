CREATE VIEW dbo.VistaGenerosPorCategoria  
AS  
    SELECT   
        gender,  
        category,  
        COUNT(*) AS num_pedidos,  
        SUM(quantity_int) AS total_unidades,  
        SUM(quantity_int * price_num) AS total_ventas,  
        AVG(quantity_int * price_num) AS ticket_promedio  
    FROM dbo.retail_sql_clean  
    GROUP BY category, gender;