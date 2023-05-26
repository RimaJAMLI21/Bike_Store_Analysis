select 

      ord.order_id,
	  CONCAT(cus.first_name, ' ', cus.last_name) as 'customer',
	  cus.city,
	  cus.state,
	  ord.order_date,
	  SUM(ite.quantity) as 'total_units',
	  SUM(ite.quantity * ite.list_price) as 'revenue',
	  pdt.product_name,
	  catg.category_name,
	  st.store_name,
	  concat(stf.first_name,' ',stf.last_name) as 'sales_rep'
	  
from sales.orders ord

join sales.customers cus on ord.customer_id = cus.customer_id
join sales.order_items ite on ord.order_id = ite.order_id
join production.products pdt on ite.product_id = pdt.product_id
join production.categories catg on pdt.category_id = catg.category_id
join sales.stores st on ord.store_id = st.store_id
join sales.staffs stf on ord.staff_id = stf.staff_id

group by 

      ord.order_id,
	  CONCAT(cus.first_name, ' ', cus.last_name),
	  cus.city,
	  cus.state,
	  ord.order_date,
	  pdt.product_name,
	  catg.category_name,
	  st.store_name,
	  concat(stf.first_name,' ',stf.last_name)