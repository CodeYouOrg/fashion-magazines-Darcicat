-- returns the customer name and total amount due for 
--the customers that have unpaid Fashion Magazine subscriptions. 


SELECT
customers.customer_name AS Customer,
--subscriptions.subscription_length*subscriptions.price_per_month AS "Amount Due"
  '$' || printf('%.2f', subscriptions.subscription_length * subscriptions.price_per_month) AS "Amount Due"
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = 'unpaid'
AND subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name
ORDER BY customer_name ASC;
