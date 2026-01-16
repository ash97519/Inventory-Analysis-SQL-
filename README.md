# SpenMart Retail Sales & Inventory Analysis (SQL)

## Overview
This project presents an end-to-end **SQL-based business analysis** of SpenMart’s retail operations, focusing on **inventory accuracy, sales performance, customer behavior, and operational optimization**. The analysis uses ERP inventory data, physical stock counts, sales transactions, and customer records to generate actionable business insights and technical recommendations.

[SQL_queries](./sql)

## Key Findings & Insights

### Inventory Accuracy Analysis
**Business Question:** How accurate is SpenMart’s ERP inventory compared to physical stock counts?

- Compared Stock_Count_Oct_31 with ERP product inventory records
- Identified 262 matching products out of 301, resulting in an 87% inventory accuracy rate
- Detected 39 mismatched records across overstatements and understatements
- Identified a critical data anomaly for product_id = 10092, where an invalid value of 444444 distorted inventory variance; the value was normalized to 0
- NULL and inconsistent numeric entries contributed to data integrity risk

**Insight:**  
A small number of manual data entry errors can significantly distort inventory metrics, financial reporting, and replenishment decisions.



### Revenue & High-Value Customer Analysis
**Business Question:** Which products and customers contribute the most revenue?

- Top revenue-generating products:
  - Item 10013 – Home Theater System (>$2,000)
  - Item 10158 – Noise Meter (>$2,000)
- Identified 7 high-value customers with lifetime spending above $1,900
- These customers represent 3.5% of the total customer base (7 of 200)

**Insight:**  
Revenue concentration among a small customer segment highlights opportunities for targeted retention and personalized marketing.



### Regional Performance Analysis
**Business Question:** Which states should scale operations up or down?

<img width="953" height="454" alt="image" src="https://github.com/user-attachments/assets/30a14aa7-0ee8-45d8-ad85-91d3f3b33bbc" />

**Scale-Up States:**
- Florida, California, Ohio, Texas
- Each generated approximately $20,000 in revenue and around 100 purchases
- Clear performance gap compared to mid- and low-performing states

**Scale-Down States:**
- Connecticut, Oklahoma, North Dakota
- Each generated less than $1,000 in total revenue

**Insight:**  
Geographic demand is uneven, indicating inefficient allocation of inventory and marketing resources in low-performing regions.



### Inventory Risk & Opportunity Cost
**Business Question:** Are inventory issues causing missed revenue opportunities?

- Identified 17 out-of-stock products (0 or NULL inventory values)
- Represents 5.6% of total inventory
- Average price per affected item: $32.94
- Estimated annual opportunity loss: $12,023

<img width="255" height="228" alt="image" src="https://github.com/user-attachments/assets/005b2f82-4589-4ae3-aac0-5064216beec8" />

**Insight:**  
Unmonitored stockouts can compound into significant annual revenue losses.



## Recommendations

### IT & Data Governance
- Enforce a single source of truth by linking all inventory-related tables via product_id.
- Restrict inventory updates to the physical stock count table.
- Replace NULL stock values with 0 for consistency.
- Apply data validation rules including numeric-only inputs and integer constraints (e.g., INT(3)).
- Implement automated checks for missing values, duplicates, outliers, and inconsistent identifiers.



### Inventory & Operations
- Implement safety stock thresholds (e.g., reorder when stock ≤ 5 units).
- Use average daily sales to automate reorder timing.
- Deploy automated low-stock alerts.
- Require end-of-day inventory verification by a second reviewer to reduce manual errors.



### Marketing & Customer Strategy
- Increase product variety and promotional focus on top-performing items.
- Introduce a customer rewards or loyalty program targeting high-value customers.
- Use purchase history to support personalized recommendations and repeat purchases.



### Regional Strategy
- High-performing states: Increase inventory depth, fulfillment capacity, and regional promotions.
- Low-performing states: Reduce physical inventory exposure and shift toward online-only sales models to lower overhead.



## Maintenance & System Integration
- Normalize the database schema by enforcing a shared `product_id` as the primary key across all inventory, sales, and stock count tables.
- Apply strict data validation rules to prevent incorrect or non-numeric inputs at the database level.
- Standardize customer, product, and state identifiers across all tables to ensure consistent joins and reporting.
- Implement automated data quality checks to detect:
  - Missing or NULL values
  - Duplicate records
  - Statistical outliers
  - Misspellings and inconsistent categorical values
- Deploy automated low-stock alerts to proactively prevent stockouts, protect revenue, and improve inventory reliability.


