-- command CLONE to create an exact copy from a table (structure & data) instantly without
-- duplicate storage

-- The CLONE command can be used with tables, schemas, and even entire databases.
-- A clone is a "zero-copy clone": storage is not physically duplicated until you change the data (copy-on-write).
-- It is extremely useful for testing environments, validations, rapid rollbacks, etc.

create or replace table tmp_train_recovered_clone clone tmp_train_recovered

select count(*) from tmp_train_recovered_clone

delete from tmp_train_recovered_clone where meter = 3;

select count(*) from tmp_train_recovered where meter = 3;