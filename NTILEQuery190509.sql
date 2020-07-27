SELECT 	product_name AS ProductName, 
		units_in_stock AS UnitsInStock, 
		NTILE(5) OVER (ORDER BY units_in_stock DESC) AS NTILE
	FROM public.products;