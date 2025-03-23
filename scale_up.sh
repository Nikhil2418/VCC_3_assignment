#!/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS="/home/nikhil/gcp-key.json"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

gcloud compute instances create auto-vm-$(date +%s) \
    --zone=us-central1-a \
    --machine-type=e2-micro \

echo "✅ GCP VM deployed successfully!"
