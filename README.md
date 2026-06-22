# Supply Chain Analytics

## Project Overview

This project analyzes global supply chain operations to evaluate delivery performance, profitability, customer segments, product categories, shipping methods, and market performance.

Using SQL, Python (Pandas), and Power BI, the analysis transforms raw operational data into business insights that help identify logistics inefficiencies, profitability risks, and growth opportunities.

**Tools:** SQL • Python (Pandas) • Power BI

**Analysis Period:** 2015 – 2018

---

## Business Objectives

* Evaluate delivery performance across the supply chain.
* Identify markets driving revenue and profit.
* Analyze customer segments and purchasing behavior.
* Measure profitability across product categories.
* Assess the impact of shipping methods on operational performance.
* Detect business risks affecting profit and customer experience.

---

## Dataset Overview

| Metric                       | Value   |
| ---------------------------- | ------- |
| Total Records                | 180,519 |
| Original Columns             | 53      |
| Final Columns After Cleaning | 47      |
| Markets                      | 5       |
| Countries                    | 164     |
| Product Categories           | 50      |
| Duplicate Records            | 0       |

---

## Data Preparation

* Validated dataset structure using shape(), info(), and describe().
* Identified and handled missing values.
* Removed non-business columns:

  * Customer Email
  * Customer Password
  * Product Image
  * Product Status
* Filled missing customer information where appropriate.
* Removed highly incomplete columns:

  * Order Zipcode
  * Product Description
* Converted order and shipping dates into datetime format.
* Exported a cleaned analytical dataset for SQL and Power BI analysis.

---

## Executive Summary

### Key Performance Indicators

| KPI                    | Value   |
| ---------------------- | ------- |
| Records Analyzed       | 180,519 |
| Late Delivery Rate     | 54.83%  |
| Negative Profit Orders | 18.71%  |
| Markets Analyzed       | 5       |
| Countries Covered      | 164     |

---

## Key Findings

### Delivery Performance

* 54.83% of shipments were delivered late.
* Delivery delays were observed across all markets.
* Standard Class handled the highest shipment volume.

**Business Insight:** Delivery performance is the most significant operational challenge, with more than half of all shipments arriving later than expected.

---

### Market Performance

Top-performing markets by profitability:

1. Europe
2. LATAM
3. Pacific Asia

**Business Insight:** Europe generated the highest overall profit, making it the strongest-performing market within the supply chain network.

---

### Product Performance

Highest-performing categories by revenue and profit:

* Fishing
* Cleats
* Camping & Hiking
* Cardio Equipment
* Women's Apparel

**Business Insight:** Revenue and profit are concentrated within a small number of product categories, highlighting key areas for inventory and sales focus.

---

### Customer Segment Analysis

Profit contribution ranking:

1. Consumer
2. Corporate
3. Home Office

**Business Insight:** Consumer customers contribute the largest share of total profit and represent the most valuable segment.

---

### Shipping Analysis

* Standard Class is the most frequently used shipping method.
* First Class generates the highest average profit per order.

**Business Insight:** Faster shipping options generate higher profitability, while Standard Class remains essential for operational volume.

---

### Profitability Risk

* 18.71% of orders generated negative profit.

**Business Insight:** Nearly one out of every five orders results in a loss, indicating opportunities to improve pricing strategies, operational efficiency, and cost control.

---

## Dashboard Preview

![Dashboard](supply_chain_dashboard.png)

---

## Sample SQL Query

```sql
SELECT
    Market,
    ROUND(SUM(Sales),2) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Revenue_Rank
FROM orders_staging
GROUP BY Market;
```

---

## Skills Demonstrated

* SQL Aggregations
* SQL Window Functions
* Data Cleaning & Transformation
* Exploratory Data Analysis (EDA)
* Supply Chain Analytics
* Logistics Performance Analysis
* Customer Segmentation
* Profitability Analysis
* KPI Development
* Power BI Dashboard Design
* Business Insight Generation

---

## Project Files

* supply_chain_analytics_dataset.csv
* eda_supply_chain.ipynb
* supply_chain_analysis.sql
* Supply_Chain_Inventory_Analytics.pbix

---

## Business Takeaway

The analysis uncovered two critical business challenges: a late delivery rate exceeding 54% and negative profitability in nearly 19% of orders. At the same time, Europe emerged as the strongest-performing market, Consumer customers generated the highest profit contribution, and a small group of product categories accounted for a significant share of business value. These insights can support logistics optimization, profitability improvement, and more effective operational decision-making across the supply chain.

