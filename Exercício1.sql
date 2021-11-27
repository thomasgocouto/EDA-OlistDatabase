SELECT 
    *
FROM 
    `summer-drive-329021.OlistDataset.olist_order_payments_dataset`
WHERE 
    payment_type IN ('voucher', 'boleto')
