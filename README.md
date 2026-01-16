# SpenMart Retail Sales & Inventory Analysis (SQL)

## Overview
This project presents an end-to-end **SQL-based business analysis** of SpenMart’s retail operations, focusing on **inventory accuracy, sales performance, customer behavior, and operational optimization**. The analysis uses ERP inventory data, physical stock counts, sales transactions, and customer records to generate actionable business insights and technical recommendations.

[SQL_queries](./sql)

## Findings, Insights, and Recommendations

### Inventory Accuracy
**How accurate is SpenMart’s current inventory compared to the physical stock count?**

- Compared the `STOCK COUNT OCT 31` table with the `SpenMart Product Information` table  
- Identified **262 matching product records out of 301**, resulting in an **87% inventory accuracy rate**
- Detected and corrected a major outlier (`product_id = 10092`) with an invalid value of `444444`, normalized to `0`

**Recommendations**
- Enforce a **single source of truth** by linking stock tables via `product_id` (primary key)
- Update inventory values only in the stock count table
- Replace NULL stock values with `0` for clarity
- Restrict stock values using `INT(3)` to prevent invalid entries
- Require end-of-day stock verification by a second reviewer



### Revenue & High-Value Customers
**Which products and customers drive the most revenue?**

- Identified top revenue-generating products:
  - `Item_Number 10013` – *Home Theater System*
  - `Item_Number 10158` – *Noise Meter*
  - Both generated **over $2,000 in revenue**
- Identified **7 high-value customers** spending over **$1,900 each**
- These customers represent **3.5% of the customer base (7/200)**

**Recommendations**
- Increase marketing focus and product variety for top-performing items
- Introduce a **customer rewards program** to retain and incentivize high-value customers



### Regional Performance
**Which states should scale operations up or down?**

**Scale Up**
- Florida, California, Ohio, Texas  
- Each generated approximately **$20,000 in revenue** and **100 purchases**
- Significant gap compared to the 4th-highest-performing state

**Scale Down**
- Connecticut, Oklahoma, North Dakota  
- Each generated **less than $1,000 in total revenue**

**Recommendations**
- Expand marketing, promotions, and physical presence in high-performing states
- Shift low-performing states toward **online-only sales** to reduce overhead



### Inventory Risk & Opportunity Cost
**Are there missed opportunities due to inventory issues?**

- Found **17 out-of-stock items** (0 or NULL values), representing **5.6% of inventory**
- Average price per out-of-stock item: **$32.94**
- Estimated **annual opportunity loss: $12,023**

**Recommendations**
- Implement **safety stock thresholds** (e.g., reorder at ≤ 5 units)
- Calculate average daily sales to automate reorder timing
- Create automated alerts to prevent stockouts before they occur



## Maintenance and Integration Recommendations

- Normalize database structure using a shared `product_id`
- Apply data validation rules to prevent incorrect inputs
- Standardize customer, product, and state identifiers across tables
- Implement automated checks for:
  - Missing values
  - Duplicates
  - Outliers
  - Misspellings
- Use automated **low-stock alerts** to protect revenue and improve reliability



