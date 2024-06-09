from google.cloud import storage
import yaml

def load_config():
    with open('config/config.yaml', 'r') as file:
        config = yaml.safe_load(file)
    return config

def load_to_gcs(transformed_data):
    config = load_config()
    client = storage.Client()
    bucket = client.bucket(config['gcs_bucket'])
    blob = bucket.blob(config['gcs_blob_name'])

    # Convert the data to a string format (e.g., JSON) before uploading
    data_string = json.dumps(transformed_data)
    blob.upload_from_string(data_string, content_type='application/json')
