-- Day 44 (Business problem practice)

-- Problem Statement: Determine the performance of each marketing campaign by calculating the return on investment (ROI) based on the total sales generated versus the campaign's cost.

-- Calculate ROI for each campaign
WITH CampaignROI AS (
    SELECT campaign_id, 
           (SUM(sales_amount) - campaign_cost) / campaign_cost AS roi
    FROM campaigns
    JOIN sales ON campaigns.campaign_id = sales.campaign_id
    GROUP BY campaign_id
)
-- Select campaign details along with ROI
SELECT c.campaign_id, c.campaign_name, cr.roi
FROM CampaignROI cr
JOIN campaigns c ON cr.campaign_id = c.campaign_id
-- Order campaigns by ROI in descending order
ORDER BY cr.roi DESC;

