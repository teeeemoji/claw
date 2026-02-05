#!/bin/bash
# Build Slidev presentations for GitHub Pages
# This script is used by GitHub Actions workflow

set -e

echo "Building Slidev presentations for GitHub Pages..."

# Build AI Applications for Frontend Developers presentation
npx slidev build knowledge/ai-applications-for-frontend-devs/slides.md --out=../../dist/ai-applications-for-frontend-devs  --base /claw/ai-applications-for-frontend-devs

# Build LLM Insights and Comparison presentation  
npx slidev build knowledge/llm-insights-and-comparison/slides.md --out=../../dist/llm-insights-and-comparison  --base /claw/llm-insights-and-comparison

# Build AI Skill Empowerment
npx slidev build knowledge/ai-skill-empowerment/slides.md --out=../../dist/ai-skill-empowerment  --base /claw/ai-skill-empowerment
