#!/bin/bash
# GhostKey Template Installer
# Moves fixed templates from ./templates/ to current directory

echo "🔧 GhostKey Fix Utility"
echo "======================"

# 1. Check if templates folder exists
if [[ ! -d "templates" ]]; then
    echo "❌ Error: 'templates' folder not found."
    echo "Please create a folder named 'templates' and save the HTML/PHP files there."
    exit 1
fi

# 2. Check if main script exists (to ensure we are in the right place)
if [[ ! -f "ghostkey.sh" ]]; then
    echo "⚠️  Warning: ghostkey.sh not found."
    echo "Make sure you are running this in the GhostKey root directory."
fi

echo "📦 Creating backups of old files..."
mkdir -p backups
cp -f win.html backups/ 2>/dev/null
cp -f droid.html backups/ 2>/dev/null
cp -f phone.html backups/ 2>/dev/null
cp -f post.php backups/ 2>/dev/null
echo "✓ Backups stored in ./backups/"

echo "🚀 Installing new templates..."
cp -v templates/post.php .
cp -v templates/win.html .
cp -v templates/droid.html .
cp -v templates/phone.html .

echo ""
echo "✅ Fix installed successfully!"
echo "You can now run: bash ghostkey.sh"
