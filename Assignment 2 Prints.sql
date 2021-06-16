USE prints;

SELECT customer_name, customer_add, customer_city, customer_zip
FROM customers;

SELECT customer_name, customer_phone
FROM customers
WHERE customer_state = 'GA';

SELECT customer_name, customer_zip
FROM customers
WHERE customer_state = 'NC' OR customer_state = 'SC';

SELECT Title, artist, order_date, ship_date
FROM items, orders, orderline
WHERE orders.order_id = orderline.order_id
AND items.item_id = orderline.item_id;

SELECT item_id, Title, artist, unit_price, on_hand
FROM items
ORDER BY unit_price;

SELECT item_id, Title, artist, unit_price, on_hand
FROM items
WHERE unit_price > 100;

SELECT item_id, Title, artist, unit_price, on_hand
FROM items
WHERE on_hand > 300;

SELECT Title, unit_price, 2*unit_price AS retail_price
FROM items;

SELECT customer_name, customer_phone, order_date
FROM customers, orders
WHERE order_date LIKE '%2014%';

SELECT artist, Title, order_qty
FROM items, orderline
WHERE items.item_id = orderline.item_id;

SELECT Title
FROM items
WHERE unit_price BETWEEN 40 AND 100;

SELECT customer_name, Title, artist, order_qty
FROM customers, items, orderline;

SELECT customer_name, SUM(unit_price * 2) AS total_revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN orderline ON orders.order_id = orderline.order_id
JOIN items ON orderline.item_id = items.item_id
GROUP BY customer_name;


SELECT count(customer_name), customer_state
FROM customers
GROUP BY customer_state;
