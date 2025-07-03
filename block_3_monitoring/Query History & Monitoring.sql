-- get last 20 queries run along last hour
-- Utilities:
-- * Check queries performance.
-- * Analyze usage by user.
-- * Track costs by warehouse.
-- * Audit changes and executions.

SELECT 
    query_id,
    user_name,
    start_time,
    end_time,
    total_elapsed_time/1000 AS elapsed_seconds,
    rows_produced,
    query_text
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE start_time >= DATEADD(HOUR, -1, CURRENT_TIMESTAMP())
ORDER BY start_time DESC
LIMIT 20;