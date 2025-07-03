-- Objective: Use STREAM to capture changes (inserts, updates, and deletes) made to a table

-- create table
CREATE OR REPLACE TABLE energy_usage (
    building_id INT,
    meter INT,
    timestamp TIMESTAMP,
    reading FLOAT
);

-- insert rows
INSERT INTO energy_usage (building_id, meter, timestamp, reading)
VALUES 
(101, 0, '2025-01-01 00:00:00', 250.0),
(102, 0, '2025-01-01 00:00:00', 300.0),
(103, 1, '2025-01-01 00:00:00', 100.0);

-- create STREAM
CREATE OR REPLACE STREAM energy_usage_stream ON TABLE energy_usage;

-- apply changes to data
-- Insert
INSERT INTO energy_usage VALUES (104, 0, '2025-01-01 01:00:00', 270.0);

-- Update
UPDATE energy_usage
SET reading = 110.0
WHERE building_id = 103;

-- Delete
DELETE FROM energy_usage
WHERE building_id = 101;

-- query STREAM (extra columns with info regarding previous applied changes to modified rows)
SELECT * FROM energy_usage_stream;