-- Create a zero-copy clone of a table and validate independence between them

-- create clone from table, initially it's an exact copy without duplicate storage, same storage until one of
-- them is modified
CREATE OR REPLACE TABLE energy_usage_clone CLONE energy_usage;

-- new row created at clone table
INSERT INTO energy_usage_clone VALUES (105, 0, '2025-01-01 02:00:00', 280.0);

-- new row only exists at clone table
SELECT * FROM energy_usage ORDER BY building_id;
SELECT * FROM energy_usage_clone ORDER BY building_id;

-- query to check tables storage
SHOW TABLES IN SCHEMA PUBLIC;

SELECT 
  "name", 
  "bytes", 
  "rows"
FROM 
  TABLE(RESULT_SCAN(LAST_QUERY_ID()))
WHERE 
  "name" IN ('ENERGY_USAGE', 'ENERGY_USAGE_CLONE');