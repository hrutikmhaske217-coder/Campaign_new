-- Comprehensive Marketing SQL Queries

-- Campaign Performance Analysis
SELECT campaign_id, SUM(clicks) AS total_clicks, SUM(impressions) AS total_impressions,
       (SUM(clicks) / SUM(impressions)) * 100 AS click_through_rate,
       SUM(cost) AS total_cost, SUM(revenue) AS total_revenue,
       (SUM(revenue) - SUM(cost)) AS profit,
       ((SUM(revenue) - SUM(cost)) / SUM(cost)) * 100 AS roi
FROM marketing_campaigns
GROUP BY campaign_id;

-- Customer Segmentation
SELECT customer_segment, COUNT(customer_id) AS total_customers, AVG(purchase_value) AS avg_purchase_value
FROM customers
GROUP BY customer_segment;

-- ROI Calculations
SELECT campaign_id,
       (SUM(revenue) - SUM(cost)) / SUM(cost) * 100 AS roi
FROM campaign_results
GROUP BY campaign_id;

-- Funnel Analysis
SELECT stage, COUNT(customer_id) AS total_customers,
       (COUNT(customer_id) / SUM(COUNT(customer_id)) OVER()) * 100 AS conversion_rate
FROM funnel_stages
GROUP BY stage;