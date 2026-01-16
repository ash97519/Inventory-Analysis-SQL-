-- Question 3 SQL Commands
-- In which States should SpenMart scale up or scale down operations and why?

SELECT C.State, ROUND(SUM(O.Order_Amount), 2) AS Total_Revenue, Count(Distinct(C.Customer_ID)) AS '# of Distinct Customers', Count(C.Customer_ID) AS 'Total # of Purchases Made' FROM [SpenMart Order Data] AS O 
Inner JOIN [SpenMart Customer List] AS C ON O.Customer_ID = C.Customer_ID 
GROUP BY C.State ORDER BY Total_Revenue DESC
