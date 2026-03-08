-- Create Snowflake Storage Integration for AWS S3
-- Replace <your_IAM_role> and <your_s3_bucket> with your AWS resources

CREATE OR REPLACE STORAGE INTEGRATION ecommerce_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<your_IAM_role>'
STORAGE_ALLOWED_LOCATIONS = ('s3://<your_s3_bucket>/raw/');


-- Set warehouse context
USE DATABASE ECOMMERCE_DWH;
USE SCHEMA RAW;


-- Create external stage pointing to S3 raw landing zone
CREATE OR REPLACE STAGE ecommerce_s3_stage
STORAGE_INTEGRATION = ecommerce_s3_integration
URL = 's3://<your_s3_bucket>/raw/'
FILE_FORMAT = (
    TYPE = CSV
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
);
