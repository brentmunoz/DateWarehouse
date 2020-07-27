SELECT 	
		SUM(o.order_total) DOLLAR_AMOUNT_OF_SALES, 
		o.sales_rep_id 
		FROM 
			(SELECT DISTINCT
					order_id,
					order_date,
					order_total,
					sales_rep_id
					FROM portfolio.dim_orders) o
		GROUP BY o.sales_rep_id
		ORDER BY o.sales_rep_id;