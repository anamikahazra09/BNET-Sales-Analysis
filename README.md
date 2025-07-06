# BNET-Sales-Analysis

This project showcases a complete data analysis and visualization pipeline for **BNET Insurance Brokers Pvt. Ltd.**, built using **MySQL** for data querying and transformation, and **Power BI** for interactive reporting.

---

## 🔍 Overview

The **BNET Sales Analysis Dashboard** is designed to help stakeholders track, understand, and optimize the performance of sales activities across various metrics such as revenue, regions, timelines, and product categories. It is a data-driven approach to support strategic planning and real-time monitoring of sales trends within the insurance domain.

---

## 🛠️ Tools & Technologies Used

| Tool/Technology | Purpose                                                                              |
| --------------- | ------------------------------------------------------------------------------------ |
| **MySQL**       | Data storage, extraction, and querying                                               |
| **SQL**         | Writing and executing complex queries to transform raw data into meaningful insights |
| **Power BI**    | Data modeling, report creation, visualization, and interactive dashboard development |
| **DAX**         | Creating measures and KPIs for advanced data analysis                                |


## 🔗 Data Flow Architecture

1. Data was queried and cleaned in **MySQL** using structured queries involving groupings, filters, and aggregations.
2. The cleaned datasets were imported into **Power BI** via direct query.
3. Visual dashboards were developed to highlight KPIs, sales trends, agent performance, and product-wise revenue contributions.


##  Key Features of the Dashboard

*  **Time-Series Sales Trends** – Monthly and quarterly sales analysis
*  **Agent/Team Performance Tracking** – Identify top contributors
*  **Regional Sales Analysis** – Compare sales across different zones or cities
*  **Product/Policy-Wise Revenue** – Track contribution of various insurance products
*  **Custom DAX Measures** – For complex metrics like Year-over-Year (YoY) growth, target achievement, and average deal size
*  **Drill-through & Page Navigation** – For deep-diving into details without leaving the dashboard
*  **Interactive Filters** – For dynamic data slicing (e.g., by product, time, region, team)


##  Target Audience

* **Sales Teams** – To track targets, trends, and opportunities
* **Management** – For data-backed decision-making and forecasting
* **Analysts** – To dive deep into sales patterns
* **Operations** – To optimize performance across regions and teams

---

##  SQL Queries


1. **Total Premium Collected**:
```sql
Select sum(Premium) AS Total_premium
from sales;

```


2. **Total Commission Earned**:
```sql
Select SUM(commission_amount) AS Total_Commission
from sales;
```

2. **Average Commission %**:
```sql
Select AVG(`Commission_%`) AS Average_Commission
from sales;
```

4. **Number of Policies Sold**:
```sql
Select count(*) AS Total_Policies
from sales;
```

 5. **Total Net Profit**
```sql
Select sum(net_profit) AS Total_profit
from sales;
```

6. **Region-Wise Performance**
```sql
SELECT Region, SUM(Premium) AS Total_Premium, SUM(Net_Profit) AS Total_Profit
FROM sales
GROUP BY Region;
```

7. **Top Performing Salesperson**
```sql
Select salesperson, sum(net_profit) AS Total_profit
from sales
group by salesperson
order by total_profit DESC
limit 1;
```

8. **Insurer-Wise Profitability**
```sql
Select insurer, sum(net_profit) AS Total_profit
from sales
group by insurer
order by total_profit DESC;
```

9.**Monthly Sales Trend**
```sql
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, SUM(Premium) AS Total_Premium
FROM sales
GROUP BY Month
ORDER BY Month;
```

10.**Insurer Profitability Index**:
```sql
SELECT Insurer,
  AVG(Net_Profit) AS Avg_Profit,
  AVG(`Claim_Ratio_%`) AS Avg_Claim_Ratio,
  AVG(Float_Days) AS Avg_Float_Time,
  AVG(`Commission_%`) AS Avg_Comm,
  (AVG(Net_Profit) / (AVG(`Claim_Ratio_%`) + 1)) AS Profitability_Index
FROM sales
GROUP BY Insurer
ORDER BY Profitability_Index DESC;
```

11.**Policy Mix Ratio**
```sql
SELECT
  Policy_Type,
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales) AS Policy_Mix_Percentage
FROM sales
GROUP BY Policy_Type
order by policy_mix_percentage desc;
```

12.**Insurer Dependency Risk**
```sql
SELECT
  Insurer,
  SUM(Net_Profit) AS Profit,
  ROUND(100.0 * SUM(Net_Profit) / (SELECT SUM(Net_Profit) FROM sales), 2) AS Profit_Contribution_Percent
FROM sales
GROUP BY Insurer
ORDER BY Profit DESC;
```

13.**Insurer Dependency Risk**

This project effectively combines MySQL for data processing and Power BI for visualization to deliver a comprehensive sales analysis dashboard. It enables data-driven decision-making by offering clear insights into sales performance, product trends, and regional growth—supporting strategic planning and operational efficiency.

14.**Interactive Dashboard**

https://app.powerbi.com/reportEmbed?reportId=fd3b7075-a612-4915-8a32-02e038f99d14&autoAuth=true&ctid=f7638ed5-4407-4a6d-ae99-5a24fcdb9a37


14.**Conclusion**

This project effectively combines MySQL for data processing and Power BI for visualization to deliver a comprehensive sales analysis dashboard. It enables data-driven decision-making by offering clear insights into sales performance, product trends, and regional growth—supporting strategic planning and operational efficiency.





