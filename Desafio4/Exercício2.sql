/*Queremos dar um cupom de 10% do valor da última compra do cliente. 
Porém os clientes elegíveis a este cupom devem ter feito uma compra anterior a última 
(a partir da data de aprovação do pedido) que tenha sido maior ou igual o valor da última compra. 
Crie uma querie que retorne os valores dos cupons para cada um dos clientes elegíveis.
*/
SELECT
      *
      ,
      VALOR_PAGAMENTOS*0.1 VALOR_CUPOM
FROM (
        SELECT 
            *
            ,
            LAG(VALOR_PAGAMENTOS) OVER (PARTITION BY customer_unique_id ORDER BY order_approved_at) VALOR_ANTERIOR
            ,
            ROW_NUMBER()  OVER (PARTITION BY customer_unique_id ORDER BY order_approved_at DESC) ORDEM_PEDIDOS
        FROM (
                        SELECT  CLIENTES.customer_unique_id
                                ,
                                PEDIDOS.order_id
                                ,
                                PEDIDOS.order_approved_at
                                 ,
                                SUM(PAG.payment_value) AS VALOR_PAGAMENTOS
                                ,
                                COUNT(PEDIDOS.order_id) OVER (PARTITION BY CLIENTES.customer_unique_id) QT_PEDIDOS
                        FROM 
                                `summer-drive-329021.OlistDataset.olist_order_payments_dataset` AS PAG
                        INNER JOIN 
                                `summer-drive-329021.OlistDataset.olist_orders_dataset`AS PEDIDOS ON PEDIDOS.order_id = PAG.order_id
                        INNER JOIN 
                                `summer-drive-329021.OlistDataset.olist_customers_dataset` AS CLIENTES ON CLIENTES.customer_id = PEDIDOS.customer_id
                        WHERE 
                                PEDIDOS.order_approved_at IS NOT NULL
                        GROUP BY 
                                CLIENTES.customer_unique_id
                                ,
                                PEDIDOS.order_id
                                ,
                                PEDIDOS.order_approved_at
                        ORDER BY 
                                CLIENTES.customer_unique_id
                                ,
                                PEDIDOS.order_approved_at
        ) WHERE 
              QT_PEDIDOS>1
) WHERE 
      ORDEM_PEDIDOS = 1 AND VALOR_ANTERIOR >= VALOR_PAGAMENTOS
LIMIT 100
