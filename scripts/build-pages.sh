#!/bin/bash
# Build Slidev presentations for GitHub Pages
# This script is used by GitHub Actions workflow

set -e

echo "Building Slidev presentations for GitHub Pages..."

# Build AI Applications for Frontend Developers presentation
npx slidev build knowledge/ai-applications-for-frontend-devs/slides.md --out=../../dist/ai-applications-for-frontend-devs  --base /claw/ai-applications-for-frontend-devs

# Build LLM Insights and Comparison presentation  
npx slidev build knowledge/llm-insights-and-comparison/slives.md --out=../../dist/llm-insights-and-comparison  --base /claw/llm-insights-and-comparison
