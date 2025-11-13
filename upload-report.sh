#!/bin/bash

# Fuse Workspace Report Upload Script
# Usage: ./upload-report.sh /path/to/report.pdf "March 2025"

# Check if arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: ./upload-report.sh /path/to/report.pdf \"Month Year\""
    echo "Example: ./upload-report.sh ~/Downloads/report.pdf \"March 2025\""
    exit 1
fi

REPORT_FILE=$1
MONTH_YEAR=$2

# Extract year and month number
YEAR=$(date +%Y)
MONTH_NUM=$(date +%m)

# If user provides a different format, try to parse it
# This is a simple version - you might want to enhance this
FOLDER_NAME="$YEAR-$MONTH_NUM"

# Create directory
echo "Creating directory: reports/$FOLDER_NAME"
mkdir -p reports/$FOLDER_NAME

# Generate filename
FILENAME="fuse-workspace-$(echo $MONTH_YEAR | tr '[:upper:]' '[:lower:]' | tr ' ' '-').pdf"

# Copy file
echo "Copying report to: reports/$FOLDER_NAME/$FILENAME"
cp "$REPORT_FILE" "reports/$FOLDER_NAME/$FILENAME"

# Git operations
echo "Adding to git..."
git add reports/$FOLDER_NAME/

echo "Committing..."
git commit -m "Add $MONTH_YEAR monthly report"

echo "Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Report uploaded successfully!"
echo ""
echo "⚠️  IMPORTANT: Don't forget to update index.html with the new report entry:"
echo ""
echo "Add this to the reports array in index.html:"
echo ""
echo "{"
echo "    title: \"$MONTH_YEAR Report\","
echo "    date: \"$MONTH_YEAR\","
echo "    description: \"Monthly performance metrics and analytics for all Fuse Workspace locations.\","
echo "    file: \"reports/$FOLDER_NAME/$FILENAME\""
echo "},"
echo ""
