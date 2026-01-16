-- Question 4 SQL Commands
-- Are there any other areas in the data that you have identified that could lead SpenMart to profitability hitherto undreamt?
-- Identify either null or 0 values from stock quantity.
SELECT Count(*) from [STOCK COUNT OCT 31]
WHERE STOCK_COUNT_Oct_31 = 0 OR STOCK_COUNT_Oct_31 IS NULL

-- Inner join for price and stock.
SELECT AVG(P.price) 
FROM [STOCK COUNT OCT 31] AS S
INNER JOIN [SpenMart Product Information] AS P
ON S.product_id = P.product_id
WHERE STOCK_COUNT_Oct_31 = '0' or STOCK_COUNT_Oct_31 is null

-- Add the column of reorderlevel.
ALTER TABLE [STOCK COUNT OCT 31] 
ADD reorderlevel INT;

-- Establish a safety stock level of 5 units to test the trigger system.
UPDATE [STOCK COUNT OCT 31] 
SET reorderlevel = 5;

-- To get a low stock alert, create a view that flags items before they hit zero.
CREATE VIEW LowStockAlert AS 
SELECT P.product_id, S.STOCK_COUNT_Oct_31, S.reorderlevel
FROM [STOCK COUNT OCT 31] AS S
INNER JOIN [SpenMart Product Information] AS P
ON S.product_id = P.product_id
WHERE STOCK_COUNT_Oct_31 <= S.reorderlevel
