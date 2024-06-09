import yaml
from scripts.process_with_nlp import process_with_nlp
from scripts.transform_data import transform_data
import trino
import pandas as pd

def load_config():
    with open('config/config.yaml', 'r') as file:
        config = yaml.safe_load(file)
    return config

def run_trino_query(query, config):
    conn = trino.dbapi.connect(
        host=config['trino']['host'],
        port=config['trino']['port'],
        user=config['trino']['user'],
        catalog=config['trino']['catalog'],
        schema=config['trino']['schema'],
    )
    cur = conn.cursor()
    cur.execute(query)
    return cur.fetchall()

if __name__ == '__main__':
    config = load_config()
    
    # Example of running a Trino query
    with open('scripts/trino_queries.sql', 'r') as file:
        query = file.read()
    
    query_result = run_trino_query(query, config)
    df = pd.DataFrame(query_result, columns=['column1', 'column2', 'column3'])
    
    # Process data with NLP
    processed_data = process_with_nlp(df)
    
    # Transform data
    transformed_data = transform_data(processed_data)
    
    # Save or further process transformed_data
