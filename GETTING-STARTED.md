# 🎯 Getting Started with Claude Toolkit

**You're 2 minutes away from AI-assisted development!**

## Option 1: Automated Setup (Recommended)

```bash
# From your project root
cd your-project

# Run setup script
bash /path/to/portable-claude-toolkit/setup.sh

# ✅ Done! Skip to "Try It Out" below
```

---

## Option 2: Manual Setup

### Step 1: Copy Files (30 seconds)

```bash
cd your-project
cp -r /path/to/portable-claude-toolkit/.claude .
```

### Step 2: (Optional) Add Knowledge Base (30 seconds)

```bash
mkdir -p thoughts/shared/{research,plans,prs,tickets}
mkdir -p thoughts/$(whoami)
echo "thoughts/searchable/" >> .gitignore
```

### Step 3: Commit (30 seconds)

```bash
git add .claude/ thoughts/ .gitignore
git commit -m "Add Claude Toolkit for AI-assisted development"
```

---

## Try It Out

### Test 1: Use an Agent (30 seconds)

Open GitHub Copilot and type:
```
Use codebase-locator to find the main application files
```

**Expected:** AI spawns agent that finds and lists your main files organized by type

---

### Test 2: Try a Command (1 minute)

Make a small change to a file, then in Copilot type:
```
/commit
```

**Expected:** AI reviews changes, suggests commit message, asks for confirmation

---

### Test 3: Research Your Code (2 minutes)

In Copilot, type:
```
/research_codebase_nt "How does our authentication work?"
```

**Expected:** AI researches your auth implementation and provides detailed findings

---

## What You Just Got

✅ **6 AI Agents** - Specialized helpers for code exploration  
✅ **18 Commands** - Workflow automation for common tasks  
✅ **Knowledge Base** - Optional team documentation system  
✅ **Zero Config** - Works out of the box  

---

## Next Steps

### Day 1: Learn the Basics
- Read: `QUICK-REFERENCE.md` (2 minutes)
- Try: A few different agents in conversation
- Try: `/commit` command

### Week 1: Core Workflows
- Try: `/create_plan_nt` for planning
- Try: `/implement_plan` for implementation
- Try: `/describe_pr` for PR descriptions

### Week 2: Team Adoption
- Share: Show teammates the README
- Customize: Adapt commands for your stack
- Document: Start using thoughts/ directory

---

## Help & Resources

### Quick Help
- **Commands not appearing?** 
  → Check `.claude/` is in repo root, restart Copilot
  
- **Agents not working?**
  → Try in conversation: "Use codebase-locator to..."
  
- **Need thoughts/?**
  → Only for some commands, create with: `mkdir -p thoughts/shared`

### Documentation
- `README.md` - Full documentation
- `QUICK-REFERENCE.md` - Command cheat sheet
- `INVENTORY.md` - Complete file listing
- Individual command files - Detailed workflows

### Support
1. Read the command file (`.claude/commands/[name].md`)
2. Try the `*_nt` variant (simpler, no dependencies)
3. Check README.md for detailed explanations
4. Ask in team chat

---

## Share with Team

Send them this file or the full README.md. They can:

1. Copy `.claude/` to their local repo
2. Start using immediately
3. Share findings via git

**Pro Tip:** Commit `thoughts/` to git so the whole team benefits from shared knowledge!

---

## Success!

You now have AI-powered tools for:
- 🔍 Code exploration
- 📋 Planning
- ⚡ Implementation
- ✅ Verification
- 📝 Documentation

**Happy coding!** 🚀

---

## One-Line Summary

Copy `.claude/` folder to your repo → Use agents & commands in Copilot → Boost productivity

---

**Questions?** Read README.md or check QUICK-REFERENCE.md
