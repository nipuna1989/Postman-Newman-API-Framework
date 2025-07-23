#!/bin/bash

echo "Running Remwaste API Tests"

newman run collections/remwaste-api-framework.postman_collection.json \
  -e "environments/RemwasteENV.postman_environments.json" \
  --iteration-data data/login-cases.json \
  --reporters cli,json,html \
  --reporter-html-export reports/remwaste-report.html \
  --reporter-json-export reports/remwaste-report.json
