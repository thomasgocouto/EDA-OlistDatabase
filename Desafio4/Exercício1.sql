/*1- Crie uma view (SELLER_STATS) para mostrar por fornecedor, a quantidade de itens enviados, 
o tempo médio de postagem após a aprovação da compra, a quantidade total de pedidos de cada Fornecedor, 
note que trabalharemos na mesma query com 2 granularidades diferentes.
*/

WITH TEST2 AS
    (
    SELECT OI.seller_id AS seller_id, COUNT(O.order_id) AS ShippedCount
    FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
    INNER JOIN    
    `summer-drive-329021.OlistDataset.olist_orders_dataset` O
    ON
    OI.order_id=O.order_id
    WHERE O.order_status='shipped'
    GROUP BY 
    OI.seller_id
    )

SELECT 
    OI.seller_id
    , 
    COUNT(DISTINCT OI.order_item_id)
    ,
    T2.ShippedCount
    , 
    AVG(DATE_DIFF(O.order_delivered_carrier_date, O.order_purchase_timestamp, DAY)) 
FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
INNER JOIN    
    `summer-drive-329021.OlistDataset.olist_orders_dataset` O
ON
    OI.order_id=O.order_id
INNER JOIN 
    TEST2 T2
ON 
    OI.seller_id=T2.seller_id
GROUP BY 
    OI.seller_id,T2.ShippedCount
