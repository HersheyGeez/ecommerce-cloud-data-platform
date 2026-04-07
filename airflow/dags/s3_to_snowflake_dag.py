from airflow.sdk import dag, task
from pendulum import datetime

from airflow.providers.snowflake.operators.snowflake import SnowflakeOperator


@dag(
    dag_id="s3_to_snowflake_raw_load",
    start_date=datetime(2026, 1, 1, tz="UTC"),
    schedule="@daily",
    catchup=False,
    tags=["snowflake", "raw"],
)
def snowflake_dag():

    load_orders = SnowflakeOperator(
        task_id="load_orders",
        sql="""
        COPY INTO raw.orders
        FROM @my_s3_stage/raw/olist_orders_dataset/{{ ds }}/
        FILE_FORMAT = (FORMAT_NAME = my_csv_format)
        """,
        snowflake_conn_id="snowflake_default"
    )

    load_orders


dag = snowflake_dag()