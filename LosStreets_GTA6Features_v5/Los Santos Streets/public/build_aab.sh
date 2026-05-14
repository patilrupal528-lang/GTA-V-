#!/bin/bash
# build_aab.sh — Automated build script for Los Santos Streets
# Run this after Android Studio is installed on your machine.
# Usage: chmod +x build_aab.sh && ./build_aab.sh

set -e
echo "========================================"
echo "  Los Santos Streets — AAB Build Script"
echo "========================================"

# Step 1: Install dependencies
echo ""
echo "[1/5] Installing dependencies..."
npm install

# Step 2: Build web app
echo ""
echo "[2/5] Building web app..."
npm run build

# Step 3: Add Android (skip if already added)
if [ ! -d "android" ]; then
  echo ""
  echo "[3/5] Adding Capacitor Android..."
  npx cap add android
else
  echo ""
  echo "[3/5] Android directory already exists, skipping add..."
fi

# Step 4: Sync Capacitor
echo ""
echo "[4/5] Syncing Capacitor..."
npx cap sync

# Step 5: Build AAB via Gradle (requires Android SDK)
echo ""
echo "[5/5] Building release AAB..."
if [ -d "android" ]; then
  cd android
  # Build debug AAB for testing (no signing needed)
  ./gradlew bundleDebug
  cd ..
  echo ""
  echo "✅ Debug AAB created at:"
  echo "   android/app/build/outputs/bundle/debug/app-debug.aab"
  echo ""
  echo "For release AAB, open Android Studio:"
  echo "  npx cap open android"
  echo "  Build → Generate Signed Bundle / APK"
else
  echo "❌ Android directory not found. Run: npx cap add android"
fi

echo ""
echo "========================================"
echo "  Build complete!"
echo "========================================"
