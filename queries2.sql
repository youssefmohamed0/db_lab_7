SELECT w.warehouse_id, w.warehouse_city, COUNT(s.order_id) AS order_count FROM warehouse AS w LEFT JOIN shipment AS s on w.warehouse_id=s.warehouse_id GROUP BY w.warehouse_id, w.warehouse_city; 

SELECT customer_name, COUNT(order_id) FROM customer as c LEFT JOIN `order` as o ON c.customer_id=o.customer_id GROUP BY c.customer_id, customer_name; 

SELECT i.item_id, i.unit_price FROM item AS i LEFT JOIN `order_item` AS oi ON i.item_id=oi.item_id WHERE oi.order_id IS NULL;

-- SELECT i.item_id, i.unit_price FROM item AS i WHERE i.item_id NOT IN (SELECT item_id FROM order_item); 