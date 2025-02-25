#!/usr/bin/env bash

# Directory containing your modules
MODULES_DIR="./modules"

# Output file name for documentation
OUTPUT_FILE="README.md"

# Loop through each module directory
for module in $(find "$MODULES_DIR" -mindepth 1 -maxdepth 1 -type d); do
  echo "Generating documentation for module: $(basename "$module")"
  
  # Generate Markdown documentation
  terraform-docs markdown table --output-file "$module/$OUTPUT_FILE" "$module"
  
  echo "Documentation generated at: $module/$OUTPUT_FILE"
done

echo "Documentation generation complete for all modules."