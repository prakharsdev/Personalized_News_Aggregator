#!/bin/bash

# Script to initialize Databricks cluster

# Databricks CLI configuration
DATABRICKS_HOST="https://<your-databricks-instance>"
DATABRICKS_TOKEN="<your-databricks-token>"

# Cluster configuration
CLUSTER_NAME="news-aggregator-cluster"
NUM_WORKERS=2
SPARK_VERSION="7.3.x-scala2.12"

# Create cluster
databricks clusters create \
  --json '{
    "cluster_name": "'"${CLUSTER_NAME}"'",
    "spark_version": "'"${SPARK_VERSION}"'",
    "node_type_id": "i3.xlarge",
    "autotermination_minutes": 30,
    "num_workers": '"${NUM_WORKERS}"'
  }' \
  --host "${DATABRICKS_HOST}" \
  --token "${DATABRICKS_TOKEN}"
