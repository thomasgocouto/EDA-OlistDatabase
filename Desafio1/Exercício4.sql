/*4-retorne pedidos que foram feitos somente no ano de 2017.
*/
SELECT 
    order_id
FROM 
    `summer-drive-329021.OlistDataset.olist_orders_dataset`
WHERE
    EXTRACT(YEAR FROM order_purchase_timestamp)=2017
