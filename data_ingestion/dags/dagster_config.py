from dagster import pipeline, solid, repository
from scripts.transform_data import transform_data
from scripts.load_to_gcs import load_to_gcs

@solid
def extract_data(context):
    # Implementation to extract data from Pub/Sub or other sources
    pass

@solid
def transform_data_solid(context, raw_data):
    return transform_data(raw_data)

@solid
def load_data_solid(context, transformed_data):
    load_to_gcs(transformed_data)
    context.log.info("Data loaded to GCS successfully.")

@pipeline
def news_etl_pipeline():
    raw_data = extract_data()
    transformed_data = transform_data_solid(raw_data)
    load_data_solid(transformed_data)

@repository
def news_etl_repository():
    return [news_etl_pipeline]
