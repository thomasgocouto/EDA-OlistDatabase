/*1-Explore as bases realizando JOINS entre elas
Que retorne a quantidade de items vendidos em cada categorias 
por estado em que o cliente se encontra, mostrando somente categorias
 que tenham vendido uma quantidade de items acima de 1000 items.
*/
--Selecionar: C.customer_state, P.product_category_name, COUNT(OI.order_item_id)
--Agrupar por:  C.customer_state, P.product_category_name
--Clausula: COUNT(OI.order_item_id)>1000
--Ordem dos JOINS: olist_customers_dataset, olist_orders_dataset, olist_order_items_dataset, olist_products_dataset

SELECT 
    C.customer_state AS State
    , 
    P.product_category_name AS ProductCategory
    , 
    COUNT(OI.order_item_id) AS ItensSelled
FROM
    `summer-drive-329021.OlistDataset.olist_customers_dataset` C
INNER JOIN
    `summer-drive-329021.OlistDataset.olist_orders_dataset` O
ON 
    C.customer_id=O.customer_id
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
ON 
    O.order_id=OI.order_id
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_products_dataset` P
ON 
    OI.product_id=P.product_id
GROUP BY 
    C.customer_state
    , 
    P.product_category_name
HAVING
    COUNT(OI.order_item_id)>1000
ORDER BY 
    ItensSelled DESC
    ,
    State
    , 
    ProductCategory
