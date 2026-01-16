-- Question 2 SQL Commands – Part 1
-- Which products are driving the most revenue?

SELECT Item_Number, SUM(Round(Order_Amount, 2)) AS Total_Revenue FROM [SpenMart Order Data]
GROUP BY Item_Number 
ORDER BY Total_Revenue DESC
 
-- Figure 1: Total Revenue per Item Number Table 
-- Question 2 SQL Commands – Part 2
-- Which customers are making high-value purchases?
SELECT C.Customer_ID, C.First_Name, C.Last_Name, ROUND(SUM(O.Order_Amount),2) AS Total_Spent FROM [SpenMart Order Data] AS O 
INNER JOIN [SpenMart Customer List] AS C ON O.Customer_ID = C.Customer_ID 
GROUP BY C.Customer_ID, C.First_Name, C.Last_Name ORDER BY Total_Spent DESC
