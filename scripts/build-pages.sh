#!/bin/bash
# Build Slidev presentation for GitHub Pages
# This script is used by GitHub Actions workflow

set -e

echo "Building Slidev presentation for GitHub Pages..."

# Install dependencies
npm ci

# Build the presentation
npm run build

# Create .nojekyll file to prevent Jekyll processing
touch dist/.nojekyll

# Create CNAME file if needed (uncomment and modify if you have a custom domain)
# echo "your-domain.com" > dist/CNAME

echo "Build completed successfully!"
echo "Files are ready in dist/ directory"