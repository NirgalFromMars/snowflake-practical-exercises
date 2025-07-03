# Snowflake SQL Exercises

This repository contains a collection of SQL exercises and experiments performed using **Snowflake**, organized into thematic blocks. The goal is to consolidate hands-on experience with the Snowflake platform, exploring both advanced SQL features and Snowflake-specific functionalities.

## 🚀 Objectives

- Reinforce knowledge of advanced SQL concepts using real datasets.
- Explore Snowflake-specific features such as Time Travel, Zero-Copy Cloning, and Data Sharing.
- Gain practical experience through structured exercises using Snowflake Worksheets and Projects.

## 📁 Repository Structure

snowflake-exercises/
├── block_1_sql_queries/ # Advanced SQL queries on the ASHRAE dataset
│ ├── 01_top_buildings_by_meter.sql
│ ├── 02_max_delta_by_building.sql
│ ├── ...
├── block_2_snowflake_features/ # Snowflake-specific functionality
│ ├── 01_time_travel_recovery.sql
│ ├── 02_clone_behavior.sql
│ ├── ...
├── block_3_data_sharing/ # Data sharing simulations (internal & external)
│ ├── 01_create_provider_share.sql
│ ├── ...
└── screenshots/ # Visual evidence of results

## 📌 Dataset Used

Most exercises are based on the **ASHRAE Energy Prediction** dataset, used in the context of a broader dbt project. A few additional tables were created temporarily for testing specific Snowflake features.

## 🧪 How to Reproduce

These scripts were developed and executed using Snowflake Projects and Worksheets. To run them:

1. Use or create a Snowflake trial account.
2. Load the necessary data (mainly `silver_train` from the ASHRAE dataset).
3. Open each `.sql` file in Worksheets or Snowflake Projects UI and execute step by step.

## 🧠 Summary of Topics Covered

### Block 1 – Advanced SQL Queries
- Aggregations and window functions
- CTEs and filtering techniques
- Time-based grouping and delta analysis

### Block 2 – Snowflake-Specific Features
- Time Travel
- Zero-Copy Cloning
- Metadata queries using `INFORMATION_SCHEMA`
- Storage behavior analysis

### Block 3 – Data Sharing
- Internal and external share simulation
- Testing access and visibility from consumers

## 🧾 Notes

- All code is commented in English.
- Screenshots are included to show expected results for key queries.
- This work complements a larger end-to-end data project using Snowflake + dbt, included at this GitHub.

## 📬 Contact

Feel free to reach out or explore more in my [GitHub profile](https://github.com/NirgalFromMars).

---