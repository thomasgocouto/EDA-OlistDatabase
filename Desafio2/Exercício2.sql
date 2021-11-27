/*2-Mostre os 5 clientes (customer_id) que gastaram mais dinheiro em compras, 
qual foi o valor total de todas as compras deles, quantidade de compras, e 
valor médio gasto por compras, ordene os mesmos por ordem decrescente pela media do valor de compra.
*/
--Selecionar: C.customer_id, COUNT(O.order_id), SUM(OI.price), AVG(OI.price)
--Ordenar por: AVG(OI.price) DESC

SELECT
     C.customer_id AS CustomerID
     , 
     COUNT(O.order_id) AS OrderCount
     , 
     SUM(OI.price) AS TotalSpend
     , 
     AVG(OI.price) AS AverageSpend
    
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
GROUP BY 
    C.customer_id
ORDER BY 
    AVG(OI.price) DESC
LIMIT 5
