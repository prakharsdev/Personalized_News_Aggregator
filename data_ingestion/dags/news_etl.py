from dagster import execute_pipeline
from dagster_config import news_etl_pipeline

if __name__ == "__main__":
    execute_pipeline(news_etl_pipeline)
