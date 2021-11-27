/*1-selecione os dados da tabela de pagamentos onde só apareçam os tipos de pagamento “VOUCHER” e “BOLETO”.
*/
SELECT 
    *
FROM 
    `summer-drive-329021.OlistDataset.olist_order_payments_dataset`
WHERE 
    payment_type IN ('voucher', 'boleto')
