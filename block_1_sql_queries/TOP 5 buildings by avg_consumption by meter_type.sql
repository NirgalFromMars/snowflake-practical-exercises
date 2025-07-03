with avg_consumption as (
    select
        building_id,
        meter,
        avg(meter_reading) as avg_consumption
    from public.silver_train
    group by building_id, meter
),
ranked as (
    select
        *,
        rank() over (partition by meter order by avg_consumption desc) as rk
    from avg_consumption
)
select *
from ranked
where rk <= 5;