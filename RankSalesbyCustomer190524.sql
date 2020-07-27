SELECT 	dt.first_name AS FirstName,
		dt.last_name AS LastName,
		dt.product_name AS ProductName,
		dt.Sales
		FROM(
			SELECT 	jt.order_id,
					jt.product_id,
					jt.product_name,
					jt.first_name,
					jt.last_name,
					jt.sales,
					ROW_NUMBER() OVER(PARTITION BY jt.employee_id ORDER BY jt.sales DESC) AS rank
					FROM
					(SELECT	ord.order_id,
							ord.employee_id,
							od.product_id,
							pr.product_name,
							emp.first_name,
							emp.last_name,
							(od.unit_price * od.quantity) * (1 - od.discount) AS Sales
							FROM orders ord
							LEFT JOIN employees emp ON ord.employee_id = emp.employee_id
							LEFT JOIN order_details od on ord.order_id = od.order_id
							LEFT JOIN products pr ON od.product_id = pr.product_id) AS jt) AS dt
		WHERE dt.rank = 1
		ORDER BY dt.first_name, dt.last_name
;