-- using correct schema context
USE DATABASE ECOMMERCE_DWH;
USE SCHEMA RAW;

-- creating internal stage

CREATE STAGE IF NOT EXISTS RAW_STAGE;
