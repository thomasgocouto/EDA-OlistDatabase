/*5-encontre os clientes do estado de SP e que não morem na cidade de São Paulo.
*/
SELECT 
    customer_id
FROM 
    `summer-drive-329021.OlistDataset.olist_customers_dataset`
WHERE
    customer_state='SP'
    AND 
    customer_city<>'sao paulo'
