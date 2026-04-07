from airflow.sdk import dag
from pendulum import datetime
from airflow.operators.bash import BashOperator


@dag(
    dag_id="dbt_transformation_pipeline",
    start_date=datetime(2026, 1, 1, tz="UTC"),
    schedule="@daily",
    catchup=False,
    tags=["dbt", "transform"],
)
def dbt_dag():

    dbt_run_staging = BashOperator(
        task_id="dbt_run_staging",
        bash_command="cd /opt/airflow/dbt && dbt run --select staging"
    )

    dbt_run_marts = BashOperator(
        task_id="dbt_run_marts",
        bash_command="cd /opt/airflow/dbt && dbt run --select marts"
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /opt/airflow/dbt && dbt test"
    )

    dbt_run_staging >> dbt_run_marts >> dbt_test


dag = dbt_dag()