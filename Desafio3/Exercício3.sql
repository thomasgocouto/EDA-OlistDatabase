/*3-Queremos saber sobre as categorias válidas, sua soma total dos valores de vendas, 
um ranqueamento de maior valor para menor valor junto com o somatório acumulado dos
valores pela mesma regra do ranqueamento.
*/

/*Query buscando relação de todos os pagamentos realizados nas categorias, assim como
o rank de pagamantos, a somatoria total do pagamento e a rolagem de pagamentos.
*/
SELECT 
    PD.product_category_name
    ,
    DENSE_RANK() OVER (PARTITION BY product_category_name ORDER BY P.payment_value DESC) AS PaymentRank
    ,
    P.payment_value
    ,
    ROUND(SUM(P.payment_value) OVER (PARTITION BY product_category_name ORDER BY P.payment_value ASC),2) AS SumPaymentRolled
    ,
    ROUND(SUM(P.payment_value) OVER (PARTITION BY product_category_name),2) AS TotalPaymentAmount
    
FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_products_dataset` PD
ON
    OI.product_id=PD.product_id
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_order_payments_dataset` P
ON
    OI.order_id=P.order_id
WHERE 
    PD.product_category_name IS NOT NULL
    AND
    P.payment_value<>0
ORDER BY
    PD.product_category_name
    ,
    P.payment_value DESC


------------------

/*Query agrupando categorias buscando verificar Pagamento total por categoria,
Rank por agregado de Categoria e Rolagem de agregados de pagamento entre categorias.
*/
WITH TotalPaymentPerCategory AS
(
SELECT 
    PD.product_category_name AS Category
    ,
    ROUND(SUM(P.payment_value),2) AS TotalPayment
    
FROM 
    `summer-drive-329021.OlistDataset.olist_order_items_dataset` OI
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_products_dataset` PD
ON
    OI.product_id=PD.product_id
INNER JOIN 
    `summer-drive-329021.OlistDataset.olist_order_payments_dataset` P
ON
    OI.order_id=P.order_id
WHERE 
    PD.product_category_name IS NOT NULL
GROUP BY 
    PD.product_category_name
ORDER BY
    PD.product_category_name
    ,
    SUM(P.payment_value) DESC
)
SELECT
    Category 
    ,
    TotalPayment
    ,
    DENSE_RANK() OVER (ORDER BY TotalPayment DESC) AS PaymentRank
    ,
    ROUND(SUM(TotalPayment) OVER (ORDER BY TotalPayment DESC),2) AS TotalPaymentRolled
FROM
    TotalPaymentPerCategory
