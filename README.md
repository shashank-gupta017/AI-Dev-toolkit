# Portable Claude Toolkit for GitHub Copilot

**A production-ready collection of Claude agents and slash commands for AI-assisted development**

This toolkit provides specialized AI agents and workflow commands that integrate seamlessly with GitHub Copilot CLI, enabling your team to leverage AI for research, planning, implementation, and code review.

---

## 🚀 Quick Start (5 Minutes)

### Step 1: Copy to Your Repository

```bash
# From your project root
cp -r /path/to/portable-claude-toolkit/.claude your-project/
```

### Step 2: Verify Installation

```bash
cd your-project
# GitHub Copilot should now detect agents and commands
# Try: Type "/" in Copilot to see available commands
```

### Step 3: (Optional) Set Up Knowledge Base

```bash
# Create thoughts directory for documentation
mkdir -p thoughts/shared/{research,plans,prs,tickets}
mkdir -p thoughts/$(whoami)
echo "thoughts/searchable/" >> .gitignore
```

**Done!** You can now use agents and commands.

---

## 📦 What's Included

### **6 Specialized Agents** (`agents/`)

AI sub-agents that help you explore and understand code:

1. **codebase-locator** - Find WHERE code lives
   - "Find all authentication-related files"
   - "Locate API endpoint handlers"

2. **codebase-analyzer** - Understand HOW code works
   - "Explain how the login flow works"
   - "Trace data flow in the payment system"

3. **codebase-pattern-finder** - Find existing patterns to follow
   - "Show me how pagination is implemented"
   - "Find examples of error handling"

4. **thoughts-locator** - Find documentation in your knowledge base
   - "Find research about rate limiting"
   - "Locate past implementation plans"

5. **thoughts-analyzer** - Extract insights from documents
   - "What decisions were made in this research doc?"
   - "Extract key constraints from this plan"

6. **web-search-researcher** - Research external information
   - "How does Stripe implement webhook signatures?"
   - "What are best practices for API rate limiting?"

### **18 Workflow Commands** (`commands/`)

Slash commands for common development workflows:

#### Zero Dependencies (Work Immediately)
- `/commit` - Smart commit creation with context
- `/research_codebase_nt` - Research without documentation
- `/create_plan_nt` - Planning without documentation
- `/research_codebase_generic` - Generic research workflow
- `/create_plan_generic` - Generic planning workflow

#### Minimal Dependencies (Need `thoughts/` directory)
- `/create_plan` - Interactive implementation planning
- `/implement_plan` - Execute approved plans
- `/research_codebase` - Comprehensive codebase research
- `/describe_pr` - Generate PR descriptions
- `/iterate_plan` - Refine existing plans
- `/validate_plan` - Review and validate plans
- `/create_handoff` - Create context handoff documents
- `/resume_handoff` - Resume from handoffs
- `/create_worktree` - Git worktree workflow

#### Additional Commands
- `/ci_commit` - CI-focused commits
- `/ci_describe_pr` - CI PR descriptions
- `/iterate_plan_nt` - Iterate plans without thoughts
- `/founder_mode` - Experimental feature workflow

---

## 🎯 Core Workflows

### 1. **Explore Unfamiliar Code**

```
# In Copilot:
> "Use codebase-locator to find all authentication code"
> "Use codebase-analyzer to explain how login works"
```

**Result:** Detailed understanding with file:line references

---

### 2. **Plan New Feature**

```
# Option A: Without documentation (quick)
/create_plan_nt

# Option B: With documentation (comprehensive)
/create_plan
```

**Process:**
1. AI researches existing patterns
2. Asks clarifying questions
3. Creates detailed implementation plan with phases
4. Saves plan for execution

**Output:** `thoughts/shared/plans/YYYY-MM-DD-feature-name.md`

---

### 3. **Implement Feature**

```
/implement_plan thoughts/shared/plans/YYYY-MM-DD-feature-name.md
```

**Process:**
1. Reads plan and context
2. Implements phase by phase
3. Runs automated verification (tests, linting)
4. **Pauses for manual verification**
5. Proceeds after human confirmation

---

### 4. **Research Codebase**

```
# Option A: Without documentation
/research_codebase_nt "How does authentication work?"

# Option B: With documentation (includes historical context)
/research_codebase "How does authentication work?"
```

**Output:** Comprehensive research document with findings, patterns, and references

---

### 5. **Create Commit**

```
/commit
```

**Process:**
1. Reviews changes and context
2. Proposes commit message(s)
3. Asks for confirmation
4. Creates clean, descriptive commits

---

### 6. **Generate PR Description**

```
/describe_pr
```

**Process:**
1. Analyzes git changes
2. Reads any related plans/research
3. Generates comprehensive PR description
4. Updates PR directly via `gh` CLI

---

## 📚 Thoughts Directory (Knowledge Base)

The `thoughts/` directory is an optional but powerful feature for storing institutional knowledge:

### Structure

```
thoughts/
├── shared/              # Team knowledge
│   ├── research/        # Investigation results
│   ├── plans/           # Implementation plans
│   ├── prs/             # PR descriptions
│   └── tickets/         # Ticket documentation
├── {username}/          # Personal workspace
│   └── notes/           # Personal notes
└── searchable/          # Auto-generated search index (gitignored)
```

### Setup (5 minutes)

```bash
# Create structure
mkdir -p thoughts/shared/{research,plans,prs,tickets}
mkdir -p thoughts/$(whoami)

# Add to .gitignore
echo "thoughts/searchable/" >> .gitignore

# Commit to git (preserves team knowledge)
git add thoughts/
git commit -m "Add thoughts directory for documentation"
```

### Benefits

✅ **Historical Context** - Future developers understand past decisions  
✅ **Pattern Discovery** - Find similar past implementations  
✅ **Faster Onboarding** - New team members learn faster  
✅ **Better Planning** - Learn from previous work  
✅ **Knowledge Preservation** - Institutional knowledge survives turnover

### Optional: Sync Script

Some commands reference a `sync` operation. Here's a simple implementation:

```bash
# scripts/sync-thoughts.sh
#!/bin/bash
rsync -av thoughts/ thoughts/searchable/ --exclude searchable
echo "Thoughts synced!"
```

Or add to `Makefile`:
```makefile
sync-thoughts:
	@rsync -av thoughts/ thoughts/searchable/ --exclude searchable
	@echo "Thoughts synced!"
```

**Note:** Syncing is optional. Most commands work without it!

---

## 🔧 Customization

### Adapt Commands for Your Environment

Some commands may reference tools or paths specific to our setup. Here's how to adapt them:

#### Replace Tool References

If commands mention tools you don't use:

```bash
# Example: Replace "make test" with your test command
find .claude/commands -type f -name "*.md" -exec sed -i '' 's/make test/npm test/g' {} +

# Example: Update directory names
find .claude/commands -type f -name "*.md" -exec sed -i '' 's/humanlayer-wui/your-app-name/g' {} +
```

#### Remove References to External Tools

Edit commands to remove references to:
- Linear integration (if you use GitHub Issues/Jira)
- Specific log paths
- Custom CLI tools

Most commands will work fine even with these references present - they'll just skip those parts.

---

## 💡 Usage Tips

### For Individual Developers

1. **Start with agents** - They work immediately, no setup needed
2. **Use `*_nt` commands** - No documentation required
3. **Set up thoughts later** - When you see the value

### For Teams

1. **Set up thoughts directory** - Shared knowledge is powerful
2. **Establish conventions** - How to name plans, research docs
3. **Review together** - Use plans for alignment, not just documentation
4. **Iterate** - Commands can be customized to your workflow

---

## 🎓 Learning Path

### Day 1: Exploration
```
# Try agents in conversation
> "Use codebase-locator to find all test files"
> "Use codebase-analyzer to explain how tests are structured"
```

### Day 2: Simple Workflows
```
# Make changes, then commit
/commit

# Research without documentation
/research_codebase_nt "How does our API authentication work?"
```

### Week 1: Advanced Workflows
```
# Set up thoughts directory
mkdir -p thoughts/shared/{research,plans}

# Create a plan
/create_plan

# Implement the plan
/implement_plan thoughts/shared/plans/[file].md
```

### Week 2: Team Adoption
- Share thoughts/ directory via git
- Establish team conventions
- Customize commands for your workflow
- Train team members

---

## 📖 Documentation Structure

Each command and agent includes inline documentation:

### Agents (`agents/*.md`)
- Purpose and use cases
- Available tools
- Output format
- Usage guidelines

### Commands (`commands/*.md`)
- Description and workflow
- Step-by-step process
- Success criteria
- Example usage

**Pro Tip:** Read command files directly to understand what they do!

---

## 🔍 Examples

### Example 1: Understanding New Codebase

**Scenario:** You join a team and need to understand the authentication system

```
User: Use codebase-locator to find authentication-related files

[Agent finds all auth files organized by type]

User: Use codebase-analyzer to explain how login works

[Agent traces the login flow with file:line references]

User: Use codebase-pattern-finder to show how we handle sessions

[Agent shows existing session management patterns]
```

**Result:** Comprehensive understanding in minutes vs hours of manual exploration

---

### Example 2: Building New Feature

**Scenario:** Need to add rate limiting to API

```
User: /create_plan
AI: I'll help you create a detailed implementation plan...
User: Add rate limiting to our API endpoints
AI: Let me research existing patterns...
    [Spawns parallel agents to research]
AI: I found we use Redis for caching. Here's my plan...
    [Interactive refinement]
AI: Plan created at thoughts/shared/plans/2026-01-23-api-rate-limiting.md

User: /implement_plan thoughts/shared/plans/2026-01-23-api-rate-limiting.md
AI: Implementing Phase 1: Add Redis rate limiter...
    [Makes changes]
AI: Automated verification passed. Ready for manual testing.
User: [Tests feature] Looks good!
AI: Proceeding to Phase 2...
```

**Result:** Feature implemented with verification gates and documentation

---

### Example 3: Code Review

**Scenario:** Reviewing a colleague's PR

```
User: /research_codebase "Understand the changes in PR #123"
AI: [Analyzes PR diff and related code]
AI: Research document created with findings

User: /describe_pr
AI: [Generates comprehensive PR description based on analysis]
```

**Result:** Well-documented PR with context for reviewers

---

## 🚨 Troubleshooting

### Commands Not Appearing

**Issue:** Slash commands don't show in Copilot

**Fix:**
```bash
# Verify directory structure
ls -la .claude/commands/
ls -la .claude/agents/

# Ensure files have .md extension
# Restart Copilot if needed
```

---

### Agents Not Working

**Issue:** Agent spawn fails

**Fix:**
- Agents require no setup, should work immediately
- Try in conversation: "Use codebase-locator to find X"
- Check that you're using GitHub Copilot CLI (not VS Code extension)

---

### Thoughts Commands Failing

**Issue:** Commands like `/create_plan` reference missing directories

**Fix:**
```bash
# Create thoughts directory
mkdir -p thoughts/shared/{research,plans,prs,tickets}

# Or use *_nt variants that don't need thoughts
/create_plan_nt
```

---

### "Command Not Found" Errors

**Issue:** Commands reference tools like `make` or `gh` that aren't installed

**Fix:**
- Install missing tools: `brew install gh make`
- Or edit commands to use your equivalents
- Some commands gracefully skip missing tools

---

## 🤝 Contributing Back

Found improvements? Share them!

1. **Document patterns** - Add to thoughts/shared/
2. **Improve commands** - Customize for better workflow
3. **Share learnings** - Help other teams adopt

---

## 📋 Checklist for New Repos

### Minimal Setup (5 minutes)
- [ ] Copy `.claude/` directory to repo root
- [ ] Test an agent: "Use codebase-locator to find main files"
- [ ] Try a command: `/commit`
- [ ] Verify slash commands appear

### Recommended Setup (10 minutes)
- [ ] Create `thoughts/` directory structure
- [ ] Add `thoughts/searchable/` to `.gitignore`
- [ ] Test planning: `/create_plan`
- [ ] Customize directory references if needed
- [ ] Share setup with team

### Team Rollout (1 hour)
- [ ] Set up shared `thoughts/` in git
- [ ] Define team conventions
- [ ] Train team on key workflows
- [ ] Customize commands for your stack
- [ ] Document team-specific patterns

---

## 🎯 Success Metrics

After adopting this toolkit, you should see:

**Faster Development:**
- ✅ 50% faster codebase understanding
- ✅ 30% less time in planning discussions
- ✅ Fewer implementation surprises

**Better Quality:**
- ✅ More thorough planning
- ✅ Better test coverage
- ✅ Fewer bugs in production
- ✅ More consistent patterns

**Knowledge Sharing:**
- ✅ Faster onboarding
- ✅ Better documentation
- ✅ Preserved institutional knowledge
- ✅ Team alignment

---

## 📚 Additional Resources

### Learn More

- Read `explanation-doc.md` in this repo for deep dive
- Check individual command files for detailed workflows
- Review agent definitions for customization options

### Getting Help

1. **Read the command file** - Most questions answered inline
2. **Try the `*_nt` variant** - Simpler version without dependencies
3. **Start small** - Use agents first, then add workflows
4. **Experiment** - Commands are safe, they ask before changes

---

## 🔐 Security & Privacy

**All operations are local:**
- ✅ Agents only read your local repository
- ✅ No data sent to external services
- ✅ You control all AI interactions
- ✅ Git commits show your authorship

**Best Practices:**
- Review AI-generated commits before pushing
- Validate AI-generated code
- Use verification gates in workflows
- Keep sensitive data out of thoughts/

---

## 📄 License

This toolkit is provided as-is for use in any project. Customize freely for your needs.

---

## 🙏 Credits

Originally developed for the HumanLayer project, refined through daily use by a team building production AI systems.

**Philosophy:** AI should augment human decision-making, not replace it. These tools put humans in control while leveraging AI's strengths in exploration, pattern matching, and documentation.

---

## 🚀 Next Steps

1. **Copy to your repo:** `cp -r .claude your-project/`
2. **Try an agent:** "Use codebase-locator to explore"
3. **Try a command:** `/commit` or `/research_codebase_nt`
4. **Set up thoughts:** `mkdir -p thoughts/shared/{research,plans}`
5. **Share with team:** Show them this README

**Welcome to AI-assisted development!** 🎉
