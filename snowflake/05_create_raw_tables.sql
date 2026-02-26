-- using proper db and schema context
USE DATABASE ECOMMERCE_DWH;
USE SCHEMA RAW;


-- creating tables for olsit_orders_dataset.csv
CREATE TABLE IF NOT EXISTS ORDERS_RAW (
    order_id VARCHAR,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP_NTZ,
    order_approved_at TIMESTAMP_NTZ,
    order_delivered_carrier_date TIMESTAMP_NTZ,
    order_delivered_customer_date TIMESTAMP_NTZ,
    order_estimated_delivery_date TIMESTAMP_NTZ
);

-- creating table for olist_customer_dataset.csv
CREATE TABLE IF NOT EXISTS CUSTOMERS_RAW (
    customer_id VARCHAR,
    customer_unique_id VARCHAR,
    customer_zip_code_prefix VARCHAR,
    customer_city VARCHAR,
    customer_state VARCHAR
);

-- creating table for olist_geolocation_dataset.csv
CREATE TABLE IF NOT EXISTS GEOLOCATION_RAW (
    geolocation_zip_code_prefix VARCHAR,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR,
    geolocation_state VARCHAR
);

-- creating table for olist_order_items_dataset.csv
CREATE TABLE IF NOT EXISTS ORDER_ITEMS_RAW (
    order_id VARCHAR,
    order_item_id INTEGER,
    product_id VARCHAR,
    seller_id VARCHAR,
    shipping_limit_date TIMESTAMP_NTZ,
    price NUMBER(10,2),
    freight_value NUMBER(10,2)
);

-- creating table for olist_order_payments_dataset.csv
CREATE TABLE IF NOT EXISTS ORDER_PAYMENTS_RAW (
    order_id VARCHAR,
    payment_sequential INTEGER,
    payment_type VARCHAR,
    payment_installment INTEGER,
    payment_value NUMBER(10,2)
);

-- creating table for olist_order_reviews_dataset.csv
CREATE TABLE IF NOT EXISTS ORDER_REVIEWS_RAW (
    review_id VARCHAR,
    order_id VARCHAR,
    review_score INTEGER,
    review_comment_title VARCHAR,
    review_comment_message VARCHAR,
    review_creation_date TIMESTAMP_NTZ,
    review_answer_timestamp TIMESTAMP_NTZ
);

-- creating table for olist_products_dataset.csv
CREATE TABLE IF NOT EXISTS PRODUCTS_RAW (
    product_id VARCHAR,
    product_category_name VARCHAR,
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- creating table for olist_sellers_dataset.csv
CREATE TABLE IF NOT EXISTS SELLERS_RAW (
    seller_id VARCHAR,
    seller_zip_code_prefix VARCHAR,
    seller_city VARCHAR,
    seller_state VARCHAR
);

-- creating table for olist_category_name_translation.csv
CREATE TABLE IF NOT EXISTS CATEGORY_NAME_TRANSLATION_RAW (
    product_category_name VARCHAR,
    product_category_name_english VARCHAR
);
