-- SQL Concepts:
-- DATE_TRUNC() to group by month
-- AVG() for average monthly usage
-- LAG() to compare with the previous month
-- QUALIFY (✅ Snowflake-specific feature)
-- WITH for CTEs (Common Table Expressions)

-- meter:
-- 0 -> electricity (kWh)
-- 1 -> cold water (gallons/m3)
-- 2 -> steam (pounds)
-- 3 -> hot water (gallons/m3)

with monthly_avg as (
    select
        building_id,
        date_trunc('month', timestamp) as month,
        avg(meter_reading) as avg_consumption
    from silver_train
    where meter = 0 -- filtering by one of the meters_type (0,1,2,3)
    group by building_id, date_trunc('month', timestamp)
),

with_change as (
    select
        building_id,
        month,
        avg_consumption,
        lag(avg_consumption) over (partition by building_id order by month) as prev_month_consumption
    from monthly_avg
),

increasing as (
    select
        *,
        avg_consumption - prev_month_consumption as delta,
        100 * avg_consumption / NULLIF(prev_month_consumption, 0) as delta_percentage,
    from with_change
    where prev_month_consumption is not null
      and avg_consumption > prev_month_consumption * 1.2  -- increase > 20%
)

select *
from increasing
qualify row_number() over (partition by building_id order by delta desc) = 1
order by delta_percentage desc
limit 10;