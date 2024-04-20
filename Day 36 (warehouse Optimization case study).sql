-- Day 36 (warehouse Optimization case study)
-- Background:
-- A supply chain company operates multiple warehouses across different regions. The company has been facing challenges in managing inventory levels efficiently, leading to overstocking in some warehouses and stockouts in others. This has resulted in increased storage costs, order fulfillment delays, and customer dissatisfaction.

-- Objective:
-- The company aims to analyze warehouse inventory data, identify inventory imbalances across different locations, and optimize inventory levels to improve warehouse efficiency and reduce costs.

-- CTE to calculate average inventory levels by warehouse
WITH AvgInventoryByWarehouse AS (
    SELECT warehouse_id,
           AVG(inventory_level) AS avg_inventory_level
    FROM warehouse_inventory
    GROUP BY warehouse_id
),

-- CTE to calculate inventory surplus and shortage by warehouse
InventorySurplusShortage AS (
    SELECT warehouse_id,
           avg_inventory_level - current_inventory AS inventory_shortage,
           CASE 
               WHEN current_inventory > avg_inventory_level THEN current_inventory - avg_inventory_level
               ELSE 0
           END AS inventory_surplus
    FROM AvgInventoryByWarehouse
    JOIN warehouse_inventory ON AvgInventoryByWarehouse.warehouse_id = warehouse_inventory.warehouse_id
)

-- Main query to analyze inventory imbalances and identify optimization opportunities
SELECT warehouse_id,
       inventory_shortage,
       inventory_surplus
FROM InventorySurplusShortage
WHERE inventory_shortage > 0 OR inventory_surplus > 0
ORDER BY warehouse_id;

