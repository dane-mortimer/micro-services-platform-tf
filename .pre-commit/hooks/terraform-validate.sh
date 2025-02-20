#!/usr/bin/env bash

terraform validate

# Find all directories containing .tf files and run terraform validate
for dir in ./modules/; do
  echo "🔍 Validating Terraform in $dir..."
  
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
