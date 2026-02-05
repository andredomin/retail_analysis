CREATE   VIEW dbo.vw_ConteoPagosBasicos AS  
SELECT  
      
    CASE   
        WHEN UPPER(payment_method) LIKE '%CASH%'   
          OR UPPER(payment_method) IN ('EFECTIVO', 'CONTADO', 'METÁLICO')   
        THEN 'CASH'  
          
        WHEN UPPER(payment_method) LIKE '%CREDIT%'   
          OR UPPER(payment_method) LIKE '%CRÉDITO%'   
          OR UPPER(payment_method) IN ('CC', 'VISA', 'MASTERCARD', 'AMEX')  
        THEN 'CREDIT_CARD'  
          
        WHEN UPPER(payment_method) LIKE '%DEBIT%'   
          OR UPPER(payment_method) LIKE '%DÉBITO%'   
          OR UPPER(payment_method) IN ('DC', 'DEBITO')  
        THEN 'DEBIT_CARD'  
          
          
    END AS metodo_pago,  
      
      
    COUNT(*) AS total_transacciones  
  
FROM dbo.retail_sql_clean  
WHERE price_num > 0  
   
  AND (  
      UPPER(payment_method) LIKE '%CASH%'   
      OR UPPER(payment_method) IN ('EFECTIVO', 'CONTADO', 'METÁLICO')  
      OR UPPER(payment_method) LIKE '%CREDIT%'   
      OR UPPER(payment_method) LIKE '%CRÉDITO%'   
      OR UPPER(payment_method) IN ('CC', 'VISA', 'MASTERCARD', 'AMEX')  
      OR UPPER(payment_method) LIKE '%DEBIT%'   
      OR UPPER(payment_method) LIKE '%DÉBITO%'   
      OR UPPER(payment_method) IN ('DC', 'DEBITO')  
  )  
GROUP BY   
    CASE   
        WHEN UPPER(payment_method) LIKE '%CASH%' OR UPPER(payment_method) IN ('EFECTIVO', 'CONTADO', 'METÁLICO') THEN 'CASH'  
        WHEN UPPER(payment_method) LIKE '%CREDIT%' OR UPPER(payment_method) LIKE '%CRÉDITO%' OR UPPER(payment_method) IN ('CC', 'VISA', 'MASTERCARD', 'AMEX') THEN 'CREDIT_CARD'  
        WHEN UPPER(payment_method) LIKE '%DEBIT%' OR UPPER(payment_method) LIKE '%DÉBITO%' OR UPPER(payment_method) IN ('DC', 'DEBITO') THEN 'DEBIT_CARD'  
    END