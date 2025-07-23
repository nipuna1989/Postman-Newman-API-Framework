#!/bin/bash

# Create reports directory if it doesn't exist
mkdir -p reports

echo "Running Remwaste API Tests"

newman run collections/remwaste-api-framework.postman_collection.json \
  -e "environments/RemwasteENV.postman_environments.json" \
  --iteration-data data/login-cases.json \
  --reporters cli,htmlextra,json \
  --reporter-htmlextra-export reports/remwaste-report.html \
  --reporter-json-export reports/remwaste-report.json
