import requests
import json

DATABRICKS_HOST = "https://<your-databricks-instance>"
DATABRICKS_TOKEN = "<your-databricks-token>"
CLUSTER_ID = "<your-cluster-id>"

headers = {
    "Authorization": f"Bearer {DATABRICKS_TOKEN}",
    "Content-Type": "application/json"
}

# Function to run a Databricks notebook
def run_notebook(notebook_path):
    url = f"{DATABRICKS_HOST}/api/2.0/jobs/runs/submit"
    data = {
        "run_name": "Run Notebook",
        "existing_cluster_id": CLUSTER_ID,
        "notebook_task": {
            "notebook_path": notebook_path
        }
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    return response.json()

# Run the recommendation model notebook
run_notebook("/databricks/notebooks/recommendation_model")

# Run the data transformation notebook
run_notebook("/databricks/notebooks/data_transformation")
