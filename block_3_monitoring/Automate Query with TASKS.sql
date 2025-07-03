-- create table to store logs
CREATE OR REPLACE TABLE task_log (
    task_name STRING,
    run_time TIMESTAMP_NTZ
);

-- create programmed task
CREATE OR REPLACE TASK log_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
AS
INSERT INTO task_log (task_name, run_time)
VALUES ('log_task', CURRENT_TIMESTAMP());

-- initiate task
ALTER TASK log_task RESUME;

-- check task logs (wait few minutes)
SELECT * FROM task_log ORDER BY run_time DESC;

-- stop task
ALTER TASK log_task SUSPEND;