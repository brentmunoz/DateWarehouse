SELECT 	customer_id AS CustomerID, 
		DENSE_RANK () OVER (ORDER BY COUNT(order_id) DESC) AS Cust_Grade
		FROM orders
		GROUP BY customer_id
		ORDER BY Cust_Grade ASC, customer_id
;