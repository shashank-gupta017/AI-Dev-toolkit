#!/bin/bash
# Setup script for Portable Claude Toolkit
# Run this from your project root: bash /path/to/setup.sh

set -e

echo "🚀 Portable Claude Toolkit Setup"
echo "================================"
echo ""

# Check if we're in a git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository"
    echo "   Please run this from your project root"
    exit 1
fi

# Determine script location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "📦 Step 1: Copying .claude directory..."
if [ -d ".claude" ]; then
    echo "⚠️  .claude directory already exists"
    read -p "   Overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "   Skipping .claude copy"
    else
        rm -rf .claude
        cp -r "$SCRIPT_DIR/.claude" .
        echo "✅ .claude directory copied and updated"
    fi
else
    cp -r "$SCRIPT_DIR/.claude" .
    echo "✅ .claude directory copied"
fi

echo ""
echo "📁 Step 2: Setting up thoughts directory..."
if [ -d "thoughts" ]; then
    echo "ℹ️  thoughts directory already exists"
else
    mkdir -p thoughts/shared/{research,plans,prs,tickets}
    mkdir -p "thoughts/$(whoami)"
    cp -r "$SCRIPT_DIR/thoughts-template"/* thoughts/ 2>/dev/null || true
    echo "✅ thoughts directory created"
fi

echo ""
echo "🔒 Step 3: Updating .gitignore..."
if grep -q "thoughts/searchable/" .gitignore 2>/dev/null; then
    echo "ℹ️  .gitignore already configured"
else
    echo "" >> .gitignore
    echo "# Claude Toolkit - Thoughts search index" >> .gitignore
    echo "thoughts/searchable/" >> .gitignore
    echo "✅ .gitignore updated"
fi

echo ""
echo "🛠️  Step 4: Creating helper scripts..."
mkdir -p scripts

# Create sync script
cat > scripts/sync-thoughts.sh << 'EOF'
#!/bin/bash
# Sync thoughts directory for searchability
rsync -av thoughts/ thoughts/searchable/ --exclude searchable
echo "✅ Thoughts directory synced"
EOF
chmod +x scripts/sync-thoughts.sh
echo "✅ Created scripts/sync-thoughts.sh"

# Create Makefile target if Makefile exists
if [ -f "Makefile" ]; then
    if grep -q "sync-thoughts:" Makefile; then
        echo "ℹ️  Makefile already has sync-thoughts target"
    else
        cat >> Makefile << 'EOF'

# Claude Toolkit - Sync thoughts directory
.PHONY: sync-thoughts
sync-thoughts:
	@bash scripts/sync-thoughts.sh
EOF
        echo "✅ Added sync-thoughts target to Makefile"
    fi
fi

echo ""
echo "✅ Setup Complete!"
echo ""
echo "📝 What's been configured:"
echo "   • .claude/agents/ - 6 specialized AI agents"
echo "   • .claude/commands/ - 18 workflow commands"
echo "   • thoughts/ - Knowledge base directory"
echo "   • scripts/sync-thoughts.sh - Helper script"
echo ""
echo "🎯 Next Steps:"
echo ""
echo "1. Test an agent:"
echo "   Open Copilot and try: 'Use codebase-locator to find main files'"
echo ""
echo "2. Try a command:"
echo "   Type '/' in Copilot to see available commands"
echo "   Try: /research_codebase_nt or /commit"
echo ""
echo "3. Commit the setup:"
echo "   git add .claude/ thoughts/ scripts/ .gitignore Makefile"
echo "   git commit -m 'Add Claude Toolkit for AI-assisted development'"
echo ""
echo "4. Share with team:"
echo "   Share portable-claude-toolkit/README.md with your team"
echo ""
echo "📚 For detailed usage, see: portable-claude-toolkit/README.md"
echo ""
echo "🎉 Happy AI-assisted development!"
