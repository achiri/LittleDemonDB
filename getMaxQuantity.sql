CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(quantity)
FROM Orders