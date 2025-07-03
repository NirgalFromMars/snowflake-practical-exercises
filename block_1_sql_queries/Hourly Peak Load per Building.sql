-- Details:
-- We use extract(hour from timestamp) to group by hour of day.
-- We calculate the average electricity consumption for each hour and building.
-- Then, using row_number(), we select the hour with the highest average for each building.
-- The final result gives you: building_id, peak_hour, and its avg_consumption.

with hourly_avg as (
    select
        building_id,
        extract(hour from timestamp) as hour_of_day,
        avg(meter_reading) as avg_consumption
    from silver_train
    where meter = 0 -- filtering by a meter_type (0,1,2,3)
    group by building_id, extract(hour from timestamp)
),

peak_hour as (
    select
        building_id,
        hour_of_day,
        avg_consumption,
        row_number() over (partition by building_id order by avg_consumption desc) as rn
    from hourly_avg
)

select
    building_id,
    hour_of_day as peak_hour,
    avg_consumption as peak_avg_consumption
from peak_hour
where rn = 1
order by peak_avg_consumption desc;