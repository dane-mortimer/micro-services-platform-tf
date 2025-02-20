#!/usr/bin/env bash

terraform init -backend=false -input=false && terraform validate

find ./modules -maxdepth 1 -type d | while read -r dir; do
  echo "🔍 Validating Terraform in $dir"
  
  # Change into the directory and run terraform commands
  (cd "$dir" && terraform init -backend=false -input=false && terraform validate)

  # Check the exit status of terraform validate
  if [ $? -ne 0 ]; then
    echo "❌ Validation failed in $dir"
    exit 1
  else
    echo "✅ Validation passed in $dir"
  fi
done

echo "🎉 All Terraform validations completed successfully!"
