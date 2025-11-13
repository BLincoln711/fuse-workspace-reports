# Fuse Workspace Monthly Reports

This repository hosts monthly performance reports for Fuse Workspace locations at [reports-fuseworkspace.com](https://reports-fuseworkspace.com).

## Repository Structure

```
fuse-workspace-reports/
├── index.html          # Main landing page
├── css/
│   └── style.css      # Styles for the website
├── reports/
│   ├── 2025-01/       # January 2025 reports
│   ├── 2025-02/       # February 2025 reports
│   └── ...            # Future monthly folders
└── README.md          # This file
```

## How to Upload Monthly Reports

### Step 1: Prepare Your Report

1. Ensure your report is in PDF format (or HTML if preferred)
2. Name your file following this convention:
   - Format: `fuse-workspace-[month]-[year].pdf`
   - Example: `fuse-workspace-january-2025.pdf`

### Step 2: Add Report to Repository

#### Option A: Using GitHub Web Interface (Easiest)

1. Go to https://github.com/BLincoln711/fuse-workspace-reports
2. Navigate to the `reports` folder
3. Create a new folder for the month (e.g., `2025-03` for March 2025)
4. Click "Add file" > "Upload files"
5. Drag and drop your report PDF
6. Commit the changes

#### Option B: Using Git Command Line

```bash
# 1. Navigate to the repository
cd /Users/brandonlhendricks/fuse-workspace-reports

# 2. Pull latest changes
git pull origin main

# 3. Create folder for the new month (if it doesn't exist)
mkdir -p reports/2025-03  # Replace with current month/year

# 4. Copy your report to the folder
cp ~/path/to/your/report.pdf reports/2025-03/fuse-workspace-march-2025.pdf

# 5. Add, commit, and push
git add reports/2025-03/
git commit -m "Add March 2025 monthly report"
git push origin main
```

### Step 3: Update the Website

After uploading the report, you need to update `index.html` to display it on the website.

1. Open `index.html` in your editor
2. Find the `reports` array in the JavaScript section (around line 34)
3. Add a new entry for your report:

```javascript
const reports = [
    {
        title: "March 2025 Report",
        date: "March 2025",
        description: "Monthly performance metrics and analytics for all Fuse Workspace locations.",
        file: "reports/2025-03/fuse-workspace-march-2025.pdf"
    },
    // Add new reports here...
];
```

4. Save the file and push the changes:

```bash
git add index.html
git commit -m "Update website with March 2025 report"
git push origin main
```

### Step 4: Verify

1. Wait 2-3 minutes for GitHub Pages to rebuild
2. Visit https://BLincoln711.github.io/fuse-workspace-reports (or your custom domain)
3. Verify the new report appears on the homepage

## Quick Upload Script

You can use this quick script to upload a new report:

```bash
#!/bin/bash
# Save this as upload-report.sh and make it executable with: chmod +x upload-report.sh

# Usage: ./upload-report.sh /path/to/report.pdf "March 2025"

REPORT_FILE=$1
MONTH_NAME=$2
YEAR=$(date +%Y)
MONTH_NUM=$(date +%m)

# Create directory
mkdir -p reports/$YEAR-$MONTH_NUM

# Copy file
cp "$REPORT_FILE" reports/$YEAR-$MONTH_NUM/fuse-workspace-$(echo $MONTH_NAME | tr '[:upper:]' '[:lower:]' | tr ' ' '-')-$YEAR.pdf

# Git operations
git add reports/$YEAR-$MONTH_NUM/
git commit -m "Add $MONTH_NAME $YEAR monthly report"
git push origin main

echo "Report uploaded successfully!"
echo "Don't forget to update index.html with the new report entry."
```

## Setting Up Custom Domain

To use your custom domain `reports-fuseworkspace.com`:

1. Go to repository Settings > Pages
2. Under "Custom domain", enter: `reports-fuseworkspace.com`
3. Click Save
4. In your domain registrar (where you purchased the domain):
   - Add a CNAME record pointing to: `blincoln711.github.io`
   - Or add these A records for apex domain:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`

## Troubleshooting

### Report not showing up?
- Make sure you updated both the report file AND the index.html
- Check that the file path in index.html matches the actual location
- Wait 2-3 minutes for GitHub Pages to rebuild

### Website not loading?
- Verify GitHub Pages is enabled in repository Settings > Pages
- Check that the source is set to main branch, root directory

### Need help?
Contact Brandon at brandon@hendricks.ai

## Maintenance

- Reports are stored in chronological folders by month
- Keep file names consistent and lowercase
- Archive old reports after 12-24 months if needed
- Regularly verify all links are working

## Powered By

Developed and maintained by [Hendricks.AI](https://hendricks.ai)
