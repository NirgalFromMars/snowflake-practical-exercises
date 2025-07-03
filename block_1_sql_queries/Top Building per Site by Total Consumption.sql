-- Concepts practiced:
-- Grouping by multiple columns (GROUP BY site_id, building_id).
-- Using window functions (RANK() OVER (...)).
-- Chained CTEs (WITH).
-- Conditional selection of the top 1 by group.

with total_by_building as (
    select
        site_id,
        building_id,
        sum(meter_reading) as total_consumption
    from silver_train
    where meter = 0
    group by site_id, building_id
),

ranked as (
    select
        *,
        rank() over (partition by site_id order by total_consumption desc) as rnk
    from total_by_building
)

select 
    site_id,
    building_id,
    total_consumption
from ranked
where rnk = 1
order by site_id;