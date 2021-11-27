/*3-retorne somente os reviews que não tem comentários.
*/
SELECT 
    review_id
FROM 
    `summer-drive-329021.OlistDataset.olist_order_reviews_dataset`
WHERE 
    review_comment_message IS NULL
