-- 1. Subquery in SELECT (Scalar Subquery)
SELECT name,
       (SELECT COUNT(*) FROM Orders WHERE customer_id = Customers.id) AS total_orders
FROM Customers;

-- 2. Subquery in WHERE using IN
SELECT name FROM Customers
WHERE id IN (SELECT customer_id FROM Orders WHERE order_date > '2024-01-01');

-- 3. Subquery in WHERE using EXISTS
SELECT name FROM Customers c
WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.customer_id = c.id AND o.amount > 1000);

-- 4. Correlated Subquery
SELECT name FROM Customers c
WHERE (SELECT AVG(amount) FROM Orders o WHERE o.customer_id = c.id) > 500;

-- 5. Subquery in FROM (Derived Table)
SELECT customer_id, total_amount
FROM (
    SELECT customer_id, SUM(amount) as total_amount
    FROM Orders
    GROUP BY customer_id
) AS summary
WHERE total_amount > 2000;