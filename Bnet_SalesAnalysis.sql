create database bnet;

use bnet;

--- Total Premium---

Select sum(Premium) AS Total_premium
from sales;

Select SUM(commission_amount) AS Total_Commission
from sales;

Select AVG(`Commission_%`) AS Average_Commission
from sales;

Select count(*) AS Total_Policies
from sales;

Select sum(net_profit) AS Total_profit
from sales;

SELECT Region, SUM(Premium) AS Total_Premium, SUM(Net_Profit) AS Total_Profit
FROM sales
GROUP BY Region;

Select salesperson, sum(net_profit) AS Total_profit
from sales
group by salesperson
order by total_profit DESC
limit 1;


Select insurer, sum(net_profit) AS Total_profit
from sales
group by insurer
order by total_profit DESC;

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, SUM(Premium) AS Total_Premium
FROM sales
GROUP BY Month
ORDER BY Month;

SELECT Insurer,
  AVG(Net_Profit) AS Avg_Profit,
  AVG(`Claim_Ratio_%`) AS Avg_Claim_Ratio,
  AVG(Float_Days) AS Avg_Float_Time,
  AVG(`Commission_%`) AS Avg_Comm,
  (AVG(Net_Profit) / (AVG(`Claim_Ratio_%`) + 1)) AS Profitability_Index
FROM sales
GROUP BY Insurer
ORDER BY Profitability_Index DESC;


SELECT
  Policy_Type,
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales) AS Policy_Mix_Percentage
FROM sales
GROUP BY Policy_Type
order by policy_mix_percentage desc;

SELECT
  Insurer,
  SUM(Net_Profit) AS Profit,
  ROUND(100.0 * SUM(Net_Profit) / (SELECT SUM(Net_Profit) FROM sales), 2) AS Profit_Contribution_Percent
FROM sales
GROUP BY Insurer
ORDER BY Profit DESC;





