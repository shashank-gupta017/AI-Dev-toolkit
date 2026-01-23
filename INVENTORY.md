# Portable Claude Toolkit - File Inventory

## Directory Structure

```
portable-claude-toolkit/
├── README.md                    # Main documentation
├── QUICK-REFERENCE.md          # Quick command reference
├── setup.sh                    # Automated setup script
├── .claude/                    # Core toolkit (copy this!)
│   ├── agents/                 # 6 AI agents
│   │   ├── codebase-analyzer.md
│   │   ├── codebase-locator.md
│   │   ├── codebase-pattern-finder.md
│   │   ├── thoughts-analyzer.md
│   │   ├── thoughts-locator.md
│   │   └── web-search-researcher.md
│   └── commands/               # 18 workflow commands
│       ├── commit.md
│       ├── ci_commit.md
│       ├── create_plan.md
│       ├── create_plan_generic.md
│       ├── create_plan_nt.md
│       ├── create_handoff.md
│       ├── create_worktree.md
│       ├── describe_pr.md
│       ├── ci_describe_pr.md
│       ├── founder_mode.md
│       ├── implement_plan.md
│       ├── iterate_plan.md
│       ├── iterate_plan_nt.md
│       ├── research_codebase.md
│       ├── research_codebase_generic.md
│       ├── research_codebase_nt.md
│       ├── resume_handoff.md
│       └── validate_plan.md
└── thoughts-template/          # Optional knowledge base
    ├── README.md
    └── shared/
        ├── plans/
        │   └── TEMPLATE.md
        ├── research/
        │   └── TEMPLATE.md
        └── pr_description.md
```

## File Counts

- **6 Agents** - Specialized AI sub-agents
- **18 Commands** - Workflow slash commands
- **3 Templates** - Documentation templates
- **4 Documentation Files** - README, Quick Ref, Setup, Inventory

Total: 31 files

## What to Copy

### Minimal Setup
```bash
cp -r .claude/ your-project/
```
**Gets you:** All agents + commands (100% functional)

### Recommended Setup
```bash
cp -r .claude/ your-project/
cp -r thoughts-template/ your-project/thoughts/
```
**Gets you:** Everything + knowledge base structure

### Using Setup Script
```bash
cd your-project
bash /path/to/portable-claude-toolkit/setup.sh
```
**Gets you:** Everything + automatic configuration

## Dependencies by File

### Agents (No Dependencies)
- ✅ All 6 agents work out-of-the-box
- ✅ No external tools required
- ✅ No configuration needed

### Commands (Zero Dependencies)
- ✅ `commit.md` - Just needs git
- ✅ `ci_commit.md` - Just needs git
- ✅ `research_codebase_nt.md` - No dependencies
- ✅ `create_plan_nt.md` - No dependencies
- ✅ `research_codebase_generic.md` - No dependencies
- ✅ `create_plan_generic.md` - No dependencies

### Commands (Minimal Dependencies)
- 🔧 `create_plan.md` - Needs `thoughts/` directory
- 🔧 `implement_plan.md` - Needs `thoughts/` directory
- 🔧 `research_codebase.md` - Needs `thoughts/` directory
- 🔧 `describe_pr.md` - Needs `thoughts/` + `gh` CLI
- 🔧 `ci_describe_pr.md` - Needs `thoughts/` + `gh` CLI
- 🔧 `iterate_plan.md` - Needs `thoughts/` directory
- 🔧 `iterate_plan_nt.md` - No dependencies
- 🔧 `validate_plan.md` - Needs `thoughts/` directory
- 🔧 `create_handoff.md` - Needs `thoughts/` directory
- 🔧 `resume_handoff.md` - Needs `thoughts/` directory
- 🔧 `create_worktree.md` - Just needs git
- 🔧 `founder_mode.md` - Needs git + references other commands

**Note:** "Needs thoughts/" means just creating the directory - no external tools

## Optional Tools

These tools enhance functionality but aren't required:

- **gh** (GitHub CLI) - For PR description commands
- **git** - For all git-related commands (usually already installed)
- **make** - For some verification commands (can adapt to use npm/yarn)
- **rsync** - For thoughts sync (optional optimization)

## Size

- Total size: ~150KB
- Compressed: ~30KB
- Negligible impact on repo size

## Updates

This toolkit is versioned by copy. To update:

1. Copy new version over old
2. Review customizations you made
3. Re-apply customizations if needed

## Customization

All files are plain markdown - customize freely:
- Edit command workflows
- Adjust agent instructions
- Change templates
- Add new commands

## Support

For questions or issues:
1. Read command/agent file directly
2. Check README.md for detailed docs
3. Try `*_nt` variant for simpler version
4. Adapt for your specific tools/workflow
