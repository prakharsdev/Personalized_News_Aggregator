import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from google.cloud import storage, bigquery
import joblib

def train_model(config):
    # Load data from BigQuery
    client = bigquery.Client()
    query = "SELECT * FROM `your_project.your_dataset.user_interactions`"
    df = client.query(query).to_dataframe()

    # Data preprocessing
    label_encoder = LabelEncoder()
    df['user_id'] = label_encoder.fit_transform(df['user_id'])
    df['article_id'] = label_encoder.fit_transform(df['article_id'])

    # Train-test split
    X = df[['user_id', 'article_id']]
    y = df['interaction']
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Train model
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)

    # Save the model
    joblib.dump(model, 'model.pkl')

    # Upload the model to Google Cloud Storage
    client = storage.Client()
    bucket = client.bucket(config['gcs_bucket'])
    blob = bucket.blob('model.pkl')
    blob.upload_from_filename('model.pkl')
