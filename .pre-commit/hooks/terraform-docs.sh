#!/usr/bin/env bash

# Directory containing your modules
MODULES_DIR="./modules"

# Output file for combined documentation
OUTPUT_FILE="TF_DOCS.md"

# Clear the output file (if it exists) or create a new one
> "$OUTPUT_FILE"

# Add a header to the combined README
echo "# Terraform Modules Documentation" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Loop through each module directory
for module in $(find "$MODULES_DIR" -mindepth 1 -maxdepth 1 -type d); do
  module_name=$(basename "$module")
  echo "Generating documentation for module: $module_name"

  # Add a header for the module
  echo "## Module: \`$module_name\`" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  # Generate Markdown documentation and append to the output file
  terraform-docs markdown table "$module" >> "$OUTPUT_FILE"

  # Add a separator between modules
  echo "" >> "$OUTPUT_FILE"
  echo "---" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
done

echo "Combined documentation generated at: $OUTPUT_FILE"