{{config (materialized ="table")}}


with SalesByProductandCategory AS(
SELECT 
p.product_name, 
p.category,
SUM(s.quantity * p.price) AS TotalSales,
AVG(s.quantity * p.price) AS AVGSales,
count(s.quantity * p.price) AS CountOfSales
FROM dProduct p
JOIN fSales s
ON p.product_id = s.product_id
GROUP BY p.product_name, 
p.category)
SELECT * FROM SalesByProductandCategory