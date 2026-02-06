# AI Dev Toolkit

A collection of AI agents and workflow commands that turn your terminal into a full AI-assisted development environment. Plan features, research codebases, implement changes, and ship PRs — all through natural language.

Works with **GitHub Copilot CLI** and **Claude Code** (Anthropic).

## Prerequisites

- **Option A:** [GitHub Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli) — `brew install copilot-cli` or `npm install -g @github/copilot`
- **Option B:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — `npm install -g @anthropic-ai/claude-code`
- Git
- Optional: [GitHub CLI (`gh`)](https://cli.github.com/) for PR commands

> **Using Claude Code?** See [README-CLAUDE-CODE.md](README-CLAUDE-CODE.md) for the native `/slash_command` experience.

## Setup

### Quick Setup (Copy to any project)

```bash
cd your-project
cp -r /path/to/AI-Dev-toolkit/.claude .
```

### Full Setup (With knowledge base)

```bash
cd your-project

# Copy the toolkit
cp -r /path/to/AI-Dev-toolkit/.claude .

# Set up the knowledge base for plans, research, and PR docs
mkdir -p thoughts/shared/{research,plans,prs,tickets}
echo "thoughts/searchable/" >> .gitignore

# Commit
git add .claude/ thoughts/ .gitignore
git commit -m "Add AI Dev Toolkit"
```

### Verify

Launch `copilot` in your project directory and try:
```
Use codebase-locator to find the main application files
```

---

## What's Inside

### 6 Agents (`.claude/agents/`)

Agents are AI sub-agents that Copilot spawns for specialized tasks. Use them by name in conversation (e.g., *"Use codebase-locator to find..."*).

| Agent | What It Does | Example Prompt |
|-------|-------------|----------------|
| **codebase-locator** | Finds WHERE files and components live | *"Use codebase-locator to find all API routes"* |
| **codebase-analyzer** | Explains HOW code works with file:line refs | *"Use codebase-analyzer to trace the login flow"* |
| **codebase-pattern-finder** | Shows existing code patterns to model after | *"Use codebase-pattern-finder to show how we do pagination"* |
| **thoughts-locator** | Finds documents in the `thoughts/` knowledge base | *"Use thoughts-locator to find research about auth"* |
| **thoughts-analyzer** | Extracts key decisions and insights from docs | *"Use thoughts-analyzer on this research document"* |
| **web-search-researcher** | Researches the web for current technical info | *"Use web-search-researcher for Stripe webhook best practices"* |

**Key:** Agents are read-only and safe to use anytime. They document what exists without suggesting changes.

### 18 Commands (`.claude/commands/`)

Commands are workflow templates that guide Copilot through multi-step processes. To use a command, ask Copilot to follow it:

```
Read .claude/commands/create_plan_nt.md and follow those instructions
```

Or simply describe what you want — Copilot has access to these commands as skills:

```
Create an implementation plan for adding user authentication
```

> **Note:** Some commands may appear as skills (use `/skills list` to check). You can also invoke the `commit` skill directly. For other commands, ask Copilot to read and follow the command file.

#### Work Immediately (No setup needed)

| Command | Purpose |
|---------|---------|
| `commit` | Reviews changes, proposes commit messages, asks for confirmation |
| `ci_commit` | Same as commit but autonomous (for CI/automation) |
| `create_plan_nt` | Creates implementation plans (no `thoughts/` needed) |
| `create_plan_generic` | Generic planning (no external tool references) |
| `research_codebase_nt` | Researches and documents codebase (no `thoughts/` needed) |
| `research_codebase_generic` | Generic codebase research |
| `iterate_plan_nt` | Refines existing plans (no `thoughts/` needed) |

#### Need `thoughts/` Directory

| Command | Purpose |
|---------|---------|
| `create_plan` | Thorough implementation planning with parallel research |
| `implement_plan` | Executes plans phase-by-phase with verification gates |
| `iterate_plan` | Refines plans based on feedback |
| `validate_plan` | Verifies implementation matches plan |
| `research_codebase` | Deep codebase research with historical context |
| `describe_pr` | Generates comprehensive PR descriptions |
| `ci_describe_pr` | PR descriptions for CI/automation |
| `create_handoff` | Saves session context for another agent to resume |
| `resume_handoff` | Picks up work from a handoff document |

#### Specialized

| Command | Purpose |
|---------|---------|
| `create_worktree` | Sets up git worktree + launches implementation session |
| `founder_mode` | Retroactively creates ticket + PR for experimental work |

---

## Practical Guides

This toolkit supports two primary workflows:

- **[Building a SaaS from Scratch](GUIDE-BUILD-SAAS.md)** — Step-by-step workflow from empty repo to shipped product
- **[Working with Existing Codebases](GUIDE-EXISTING-CODEBASES.md)** — New features, improvements, and long-term maintenance
- **[Using with Claude Code](README-CLAUDE-CODE.md)** — Native slash command experience with Anthropic's CLI

---

## The `thoughts/` Knowledge Base

The `thoughts/` directory stores plans, research, and PR descriptions that commands read and write. It's optional but becomes essential for team workflows.

```
thoughts/
├── shared/           # Team-shared documents (committed to git)
│   ├── research/     # Codebase research docs
│   ├── plans/        # Implementation plans
│   ├── prs/          # PR descriptions
│   └── tickets/      # Ticket documentation
├── {username}/       # Personal workspace
└── searchable/       # Auto-generated index (gitignored)
```

Commands automatically save documents here. For example, `/create_plan` writes to `thoughts/shared/plans/YYYY-MM-DD-feature-name.md`.

---

## Customization

All files are plain markdown. Adapt them to your stack:

```bash
# Replace test runner
find .claude/commands -name "*.md" -exec sed -i '' 's/make test/npm test/g' {} +

# Replace build tool
find .claude/commands -name "*.md" -exec sed -i '' 's/make check/yarn lint/g' {} +
```

Commands referencing tools you don't have (Linear, `humanlayer`) will gracefully skip those steps.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Agents not found | Verify `.claude/` is in repo root, restart `copilot` |
| Command not recognized as `/slash` | Commands are skills, not slash commands. Ask: *"Read .claude/commands/create_plan_nt.md and follow it"* |
| `gh` not found | Install GitHub CLI: `brew install gh` |
| Agent spawn fails | Try in conversation: *"Use codebase-locator to find X"* |
| `thoughts/` errors | Create dir: `mkdir -p thoughts/shared/{research,plans,prs,tickets}` or use `_nt` variants |

---

## License

Open for use in any project. Customize freely.
