create or replace table tmp_train as
select * from silver_train;

delete from tmp_train
where building_id = 0;

select count(*) from tmp_train
where building_id = 0;

create or replace table tmp_train_recovered
as
select * from tmp_train at(offset => -60);
-- alternative: select * from tmp_train at(timestamp => to_timestamp_ltz('2025-07-02 12:30:00'));

select count(*) from tmp_train_recovered
where building_id = 0;