SELECT 	prod.product_description, 
		d.sales_quarter, 
		SUM(dollars_sold) Dollars_Sold, 
		SUM(amount_sold) Quantity_Sold
	FROM portfolio.sales_fact sf
	JOIN portfolio.products_dim prod
		ON sf.product_dim_id = prod.product_dim_id
	JOIN portfolio.date_dim d
		ON sf.date_dim_id = d.date_dim_id
	GROUP BY prod.product_description, d.sales_quarter
	ORDER BY d.sales_quarter, prod.product_description
;