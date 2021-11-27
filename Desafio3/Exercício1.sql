/*1-Crie uma tabela analítica de todos os itens que foram vendidos,
 somente mostrando pedidos interestaduais. Queremos saber quantos 
 dias os fornecedores demoram para postar o produto, se o produto chegou ou não dentro do prazo.
*/

SELECT 
    OI.product_id
    , 
    DATE_DIFF(O.order_delivered_carrier_date, O.order_purchase_timestamp, DAY) AS DaysToPost
    , 
    CASE 
        WHEN O.order_delivered_customer_date<=O.order_estimated_delivery_date THEN 'On Time' 
        ELSE 'Delayed' END AS Deadline
FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_sellers_dataset` S
ON
    OI.seller_id=S.seller_id
INNER JOIN 
   `summer-drive-329021.OlistDataset.olist_orders_dataset` O
ON 
    OI.order_id=O.order_id
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_customers_dataset` C
ON
    O.customer_id=C.customer_id
WHERE
    C.customer_state<>S.seller_state
