/*2-Crie uma query SQL que me retorne todos os pagamentos do cliente, com suas datas de aprovação,
 valor da compra e o valor total que o cliente já gastou em todas as suas compras,
 me mostrando somente os clientes onde o valor da compra é diferente do valor total já gasto.
*/

SELECT 
    C.customer_unique_id
    , 
    O.order_approved_at
    , 
    P.payment_value 
    , 
    SUM(P.payment_value) AS TotalPayment
FROM
`summer-drive-329021.OlistDataset.olist_orders_dataset` O
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_customers_dataset` C
ON
    O.customer_id=C.customer_id
INNER JOIN
    `summer-drive-329021.OlistDataset.olist_order_payments_dataset` P
ON 
    O.order_id=P.order_id
GROUP BY 
    C.customer_unique_id
    , 
    O.order_approved_at
    , 
    P.payment_value
HAVING 
    P.payment_value <> SUM(P.payment_value)
ORDER BY 
    SUM(P.payment_value) DESC
