--5.	Write some basic queries to understand the level of detail for each table and how the tables relate to each other (see Lab #1). 
SELECT * FROM departments 
SELECT * FROM orders LIMIT 10000
SELECT * FROM aisles LIMIT 10000
SELECT * FROM products LIMIT 10000
SELECT * FROM order_products_prior LIMIT 10000
SELECT * FROM order_products_train LIMIT 10000

SELECT * FROM departments --Var :department
SELECT * FROM orders LIMIT 10000 --Int :order_id, user_id, order_number, order_dow; Char : eval_set; Double precision :days_since_prior_order
SELECT * FROM aisles LIMIT 10000 --Var :aisle
SELECT * FROM products LIMIT 10000 -- Int :product_id, aisle_id, department_id; Char :product_name
SELECT * FROM order_products_prior LIMIT 10000 --Int :order_id, product_id, add_to_cart_order, reordered
SELECT * FROM order_products_train LIMIT 10000 --Int :order_id, product_id, add_to_cart_order, reordered

SELECT count (*) FROM departments --63
SELECT count (*) FROM orders --6,842,166
SELECT count (*) FROM aisles --268
SELECT count (*) FROM products --99,376
SELECT count (*) FROM order_products_prior --64,868,978
SELECT count (*) FROM order_products_train --2,769,234
SELECT * INTO TEMP order_products_prior2 FROM order_products_prior LIMIT 10000
SELECT * INTO TEMP order_products_train2 FROM order_products_train LIMIT 10000


SELECT * FROM orders 
WHERE order_id = '3212695'

SELECT * FROM order_products_prior 
WHERE product_id = 3523

SELECT * FROM products 
ORDER BY aisle_id;

SELECT aisle_id, count(*)
   FROM products
   GROUP BY aisle_id
   ORDER BY count(*) DESC
--Aisle 100 with the highest product

SELECT * FROM products
ORDER BY department_id;

SELECT department_id, count(*)
   FROM products
   GROUP BY department_id
   ORDER BY count(*) DESC
--Department 11 with the highest products
select * from order_products_prior limit 100

--Write some SQL queries to understand the relationship between order_products_prior and order_products_train. 
SELECT * FROM order_products_prior2
UNION
SELECT * FROM order_products_train2

 
--6.Write a SQL script to create a flat file. Add “LIMIT 100” to the end of each SQL statement to save yourself from having to wait on the 
--script returning all rows. Once you’ve verified that your code is right, you can remove it and create new tables or views. See Lab #2 to review this step.

SELECT * INTO TEMP order_products_prior2 FROM order_products_prior LIMIT 100
SELECT * INTO TEMP order_products_train2 FROM order_products_train LIMIT 100


CREATE VIEW order_products_priorandtrain as
(SELECT * FROM order_products_prior2 
UNION 
SELECT * FROM order_products_train2)
LIMIT 100

SELECT count(*) FROM order_products_priorandtrain

CREATE VIEW full_flatfiles as
(SELECT a.order_id, a.product_id, a.add_to_cart_order, a.reordered,
        b.user_id, b.eval_set, b.order_number, b.order_dow, b.order_hour_of_day, b.days_since_prior_order,
        c.product_name, c.aisle_id, c.department_id,
        d.aisle,
        e.department
FROM order_products_priorandtrain AS a
JOIN orders AS b ON a.order_id = b.order_id
JOIN products AS c ON a.product_id = c.product_id
JOIN aisles AS d ON c.aisle_id = d.aisle_id
JOIN departments AS e ON c.department_id = e.department_id)


--7.Aggregate your flat file to do some basic reporting. 
--Create some datasets with differing levels of detail, using most of the categorical variables. Review Lab #3 for ideas. 

SELECT count(*) FROM full_flatfiles 
SELECT * FROM full_flatfiles

SELECT product_name, count(DISTINCT order_id) AS most_product_category_ordered, count(*) AS Most_product,
       max(aisle_id) AS top_product_aisle, count(DISTINCT reordered) AS Most_reordered_product,
       max(DISTINCT user_id) AS Highest_product_user
FROM full_flatfiles
--WHERE product_name = 'Whole Almonds'
GROUP BY 1
ORDER BY 6 DESC
--a) Most product category ordered = Strawberries, Bag of Organic Bananas and Grated Parmesan = 2
--b) Most Product is Strawberries = Strawberries, Bag of Organic Bananas and Grated Parmesan = 48
--c) Top products aisle is Ibuprofel Liquid Gels = 133
--d) Highest product user of 'Whole Almonds' = 191037 user_id

SELECT order_id, count(*) AS Most_order, count(DISTINCT reordered) AS ID_Most_reordered
FROM full_flatfiles
GROUP BY 1
ORDER BY 3 DESC
--a) Most order = 48 by order_id:5459, 1604140, 1604140
--b) ID most reordered is '5459' = 2


