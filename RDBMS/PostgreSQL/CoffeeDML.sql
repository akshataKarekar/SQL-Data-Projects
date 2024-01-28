--- Select all transactions related to existing staffs----

select * from staff st, sales_transaction st1 where st.staff_id = st1.staff_id  ;



----Select all products along with corresponding total sales----
select product_name, sum(quantity*price) as totalsales from product p, sales_detail sd where
p.product_id = sd.product_id group by p.product_name;


----Select the product type with maximum sales----
select product_type from product_type pt where pt.product_type_id = 
(select product_type_id from product p where p.product_id = (select product_id from sales_detail group by product_id
  having sum(quantity*price) >= (select sum(quantity*price) as TS from sales_detail group by product_id
								 order by TS desc limit 1)));


---Create a materialized view for staff members except for CEO and CFO----
CREATE MATERIALIZED VIEW test1 AS SELECT staff.staff_id,
staff.first_name,
staff.last_name,
staff.location
FROM staff
WHERE "position" NOT IN ('CEO', 'CFO');