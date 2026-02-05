#!/bin/bash
# Build Slidev presentation for GitHub Pages
# This script is used by GitHub Actions workflow

set -e

echo "Building Slidev presentation for GitHub Pages..."

npx slidev build knowledge/ai-applications-for-frontend-devs/slides.md --out=../../dist/ai-applications-for-frontend-devs