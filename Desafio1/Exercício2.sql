/*2-retorne os campos da tabela de produtos e calcule o volume de cada produto em um novo campo.
*/
SELECT 
    *
    ,
    (product_length_cm*product_height_cm*product_width_cm) AS Volume
FROM 
    `summer-drive-329021.OlistDataset.olist_products_dataset`
