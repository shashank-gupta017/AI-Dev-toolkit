# Quick Reference Guide

## 🚀 Most Common Workflows

### 1. Understand Code
```
"Use codebase-locator to find [feature] files"
"Use codebase-analyzer to explain how [feature] works"
```

### 2. Plan Feature
```
/create_plan_nt              # Quick planning (no docs needed)
/create_plan                 # Comprehensive planning (needs thoughts/)
```

### 3. Implement Feature
```
/implement_plan thoughts/shared/plans/YYYY-MM-DD-feature.md
```

### 4. Commit Changes
```
/commit
```

### 5. Generate PR Description
```
/describe_pr
```

### 6. Research Codebase
```
/research_codebase_nt "How does [X] work?"     # No docs needed
/research_codebase "How does [X] work?"        # Includes historical context
```

---

## 📋 All Agents

| Agent | Purpose | Example Use |
|-------|---------|-------------|
| `codebase-locator` | Find files | "Find all API routes" |
| `codebase-analyzer` | Understand code | "Explain login flow" |
| `codebase-pattern-finder` | Find patterns | "Show pagination examples" |
| `thoughts-locator` | Find docs | "Find auth research" |
| `thoughts-analyzer` | Extract insights | "Key decisions in doc X" |
| `web-search-researcher` | Web research | "Stripe webhook patterns" |

---

## 📋 All Commands

### Zero Dependencies (Work Immediately)
- `/commit` - Create commits
- `/ci_commit` - CI-focused commits
- `/research_codebase_nt` - Research (no docs)
- `/create_plan_nt` - Planning (no docs)
- `/research_codebase_generic` - Generic research
- `/create_plan_generic` - Generic planning

### With Thoughts Directory
- `/create_plan` - Interactive planning
- `/implement_plan` - Execute plans
- `/research_codebase` - Research with context
- `/describe_pr` - Generate PR descriptions
- `/ci_describe_pr` - CI PR descriptions
- `/iterate_plan` - Refine plans
- `/iterate_plan_nt` - Refine (no docs)
- `/validate_plan` - Review plans
- `/create_handoff` - Context handoff
- `/resume_handoff` - Resume work
- `/create_worktree` - Git worktree workflow
- `/founder_mode` - Experimental workflow

---

## 🎯 When to Use What

### "I need to understand existing code"
→ Use agents in conversation
- `codebase-locator` - Find files
- `codebase-analyzer` - Understand implementation
- `codebase-pattern-finder` - See examples

### "I want to research a topic"
→ Use research commands
- `/research_codebase_nt` - Quick, no setup
- `/research_codebase` - Comprehensive with docs

### "I need to plan a feature"
→ Use planning commands
- `/create_plan_nt` - Quick plan, no setup
- `/create_plan` - Detailed plan with research

### "I'm implementing a plan"
→ Use implementation command
- `/implement_plan [path]` - Execute with verification gates

### "I made changes and want to commit"
→ Use commit command
- `/commit` - Smart commit creation

### "I need to describe my PR"
→ Use PR command
- `/describe_pr` - Generate description

---

## 💡 Pro Tips

### Agent Usage
- Agents work in conversation - just ask to use them
- Spawn multiple agents in parallel for efficiency
- Agents are read-only - safe to use anytime

### Command Usage
- Type `/` to see available commands
- Commands with `_nt` suffix need no setup
- Commands ask before making changes

### Thoughts Directory
- Optional but powerful for team knowledge
- Commit to git to share with team
- Use templates for consistency

### Verification Gates
- Commands pause for manual verification
- Don't skip manual testing
- Confirms changes work as expected

---

## 🔧 Customization

### Adapt for Your Stack
```bash
# Replace test commands
sed -i 's/npm test/yarn test/g' .claude/commands/*.md

# Replace build commands
sed -i 's/npm run build/pnpm build/g' .claude/commands/*.md
```

### Adapt for Your Tools
```bash
# Update directory names
sed -i 's/old-name/new-name/g' .claude/commands/*.md
```

---

## 📚 Learn More

- See `README.md` for detailed documentation
- Read individual command files for specifics
- Check agent definitions for customization

---

## 🚨 Quick Troubleshooting

**Commands don't appear**
→ Verify `.claude/` is in repo root

**Thoughts errors**
→ Create directory: `mkdir -p thoughts/shared/{research,plans}`

**Tool not found**
→ Install tool or edit command to use your equivalent

**Agent spawn fails**
→ Try in conversation instead of command

---

## 🎉 Get Started

1. Copy to repo: `cp -r .claude your-project/`
2. Try agent: "Use codebase-locator to explore"
3. Try command: `/commit` or `/research_codebase_nt`
4. Optional: `mkdir -p thoughts/shared/{research,plans}`
5. Share with team!
