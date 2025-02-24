#!/usr/bin/env bash

echo "🔍 Validating Terraform in $dir"

terraform init -backend=false -input=false && terraform validate

if [ $? -ne 0 ]; then
  echo "❌ Validation failed in $dir"
  exit 1
else
  echo "✅ Validation passed in $dir"
fi

echo "🎉 All Terraform validations completed successfully!"
