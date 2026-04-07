from airflow.sdk import dag, task
from pendulum import datetime
import os

from airflow.providers.amazon.aws.hooks.s3 import S3Hook

S3_BUCKET = "s3_bucket_name"
LOCAL_DATA_PATH = "/opt/airflow/data/raw"

@dag(
    dag_id = "local_to_s3_data_lake_ingestion",
    start_date = datetime(year=2026, month=1, day=1, tz="UTC"),
    schedule = "@daily",
    catchup = False,
    tags = ["s3", "ingestion", "data_lake"],
)
def ingestion_dag():
    
    @task
    def discover_files():
        files = [
            f for f in os.listdir(LOCAL_DATA_PATH)
            if f.endswith('.csv')
        ]
        
        if not files:
            raise ValueError("No csv files found in data/raw")
        
        return files
    
    @task
    def upload_to_s3(file_name: str):
        
        hook = S3Hook(aws_conn_id="aws_default")
        local_path = os.path.join(LOCAL_DATA_PATH, file_name)

        dataset_name = file_name.replace(".csv", "")

        s3_key = f"raw/{dataset_name}/{{{{ ds }}}}/{file_name}"

        print(f"Uploading {file_name} → {s3_key}")

        hook.load_file(
            filename=local_path,
            key=s3_key,
            bucket_name=S3_BUCKET,
            replace=True
        )

        return f"s3://{S3_BUCKET}/{s3_key}"

    files = discover_files()

    upload_to_s3.expand(file_name=files)


dag = ingestion_dag()