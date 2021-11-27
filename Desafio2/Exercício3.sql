/*3-Mostre o valor vendido total de cada vendedor(seller_id) em cada uma das categorias 
de produtos, somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000, 
desejamos ver a categoria do produto e os vendedores, para cada uma dessas categorias mostre seus valores de venda de forma decrescente.
*/
--Selecionar: OI.seller_id, P.product_category_name, SUM(OI.price)
--Agrupar por: OI.seller_id, P.product_category_name
--Clausula: SUM(OI.price)>1000
--Ordenar por: SUM(OI.price) DESC

SELECT 
    OI.seller_id AS SellerID
    , 
    P.product_category_name AS ProductCategory
    , 
    SUM(OI.price) AS TotalSelled
FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_products_dataset` P
ON 
    OI.product_id=P.product_id
GROUP BY 
    OI.seller_id
    , 
    P.product_category_name
HAVING 
    SUM(OI.price)>1000
ORDER BY 
    SUM(OI.price) DESC
