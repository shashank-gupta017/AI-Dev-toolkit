# Using This Toolkit with Claude Code

This guide covers how to use the AI Dev Toolkit with [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic's CLI tool, the `claude` command). If you're using GitHub Copilot CLI instead, see the [main README](README.md).

Claude Code natively supports `.claude/commands/` and `.claude/agents/` — commands become `/slash_commands` and agents are spawned automatically as sub-agents.

---

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed (`npm install -g @anthropic-ai/claude-code`)
- Active Anthropic API key or Claude Pro/Team/Enterprise subscription
- Git
- Optional: [GitHub CLI (`gh`)](https://cli.github.com/) for PR commands

## Setup

```bash
cd your-project

# Copy the toolkit
cp -r /path/to/AI-Dev-toolkit/.claude .

# Optional: set up knowledge base
mkdir -p thoughts/shared/{research,plans,prs,tickets}
echo "thoughts/searchable/" >> .gitignore

git add .claude/ thoughts/ .gitignore
git commit -m "Add AI Dev Toolkit"
```

Launch Claude Code in your project:

```bash
claude
```

Type `/` to see all available commands. You should see `commit`, `create_plan_nt`, `implement_plan`, and all 18 commands listed.

---

## How It Works in Claude Code

### Slash Commands

Every `.md` file in `.claude/commands/` becomes a slash command. Type `/` followed by the command name:

```
/commit
/create_plan_nt
/implement_plan thoughts/shared/plans/YYYY-MM-DD-feature.md
/research_codebase_nt How does authentication work?
```

Text after the command name is passed as `$ARGUMENTS` to the command template.

### Agents (Sub-Agents)

Files in `.claude/agents/` define sub-agents that commands spawn automatically. When you run `/create_plan_nt`, it spawns `codebase-locator`, `codebase-analyzer`, and `codebase-pattern-finder` in parallel to research your codebase.

You can also reference agents in conversation:

```
Use codebase-locator to find all authentication files
```

### Model Selection

Some commands specify `model: opus` in their frontmatter (like `create_plan` and `iterate_plan`). Claude Code automatically uses Claude Opus for these commands and Claude Sonnet for agents, matching the complexity of each task.

---

## Commands Reference

### Planning

| Command | Purpose |
|---------|---------|
| `/create_plan_nt` | Create implementation plan (no `thoughts/` needed) |
| `/create_plan` | Thorough planning with parallel research (needs `thoughts/`) |
| `/create_plan_generic` | Generic planning (no external tool references) |
| `/iterate_plan_nt [path]` | Refine existing plan |
| `/iterate_plan [path]` | Refine plan with full research |
| `/validate_plan [path]` | Verify implementation matches plan |

### Implementation

| Command | Purpose |
|---------|---------|
| `/implement_plan [path]` | Execute plan phase-by-phase with verification gates |
| `/commit` | Review changes, propose commits, ask for confirmation |
| `/ci_commit` | Autonomous commits (for CI/automation) |

### Research

| Command | Purpose |
|---------|---------|
| `/research_codebase_nt [query]` | Research codebase (no `thoughts/` needed) |
| `/research_codebase [query]` | Deep research with historical context |
| `/research_codebase_generic [query]` | Generic codebase research |

### PR & Shipping

| Command | Purpose |
|---------|---------|
| `/describe_pr` | Generate comprehensive PR description |
| `/ci_describe_pr` | PR description for CI/automation |
| `/founder_mode` | Retroactive ticket + PR for experimental work |

### Session Management

| Command | Purpose |
|---------|---------|
| `/create_handoff` | Save session context for another session |
| `/resume_handoff [path]` | Resume from handoff document |
| `/create_worktree` | Set up git worktree + launch implementation |

---

## Agents Reference

| Agent | Tools | Purpose |
|-------|-------|---------|
| `codebase-locator` | Grep, Glob, LS | Find WHERE files and components live |
| `codebase-analyzer` | Read, Grep, Glob, LS | Explain HOW code works with file:line refs |
| `codebase-pattern-finder` | Read, Grep, Glob, LS | Show existing patterns to model after |
| `thoughts-locator` | Grep, Glob, LS | Find documents in `thoughts/` knowledge base |
| `thoughts-analyzer` | Read, Grep, Glob, LS | Extract key decisions and insights from docs |
| `web-search-researcher` | WebSearch, WebFetch, Read, Grep, Glob, LS | Research web for current technical info |

---

## Core Workflows

### Plan → Build → Ship

```
/create_plan_nt
> Add user authentication with email/password and OAuth

/implement_plan thoughts/shared/plans/YYYY-MM-DD-auth.md

/validate_plan thoughts/shared/plans/YYYY-MM-DD-auth.md

/commit

/describe_pr
```

### Research → Plan → Build

```
/research_codebase_nt How does the payment system work?

/create_plan_nt
> Add subscription upgrade/downgrade flow based on existing patterns

/implement_plan thoughts/shared/plans/YYYY-MM-DD-subscriptions.md

/commit
```

### Iterate on a Plan

```
/iterate_plan_nt thoughts/shared/plans/YYYY-MM-DD-auth.md
> Add two-factor authentication support using TOTP
```

### Session Handoff

```
/create_handoff

# ... later, in a new session ...

/resume_handoff thoughts/shared/handoffs/TICKET/YYYY-MM-DD_handoff.md
```

---

## Key Differences from Copilot CLI

| Feature | Claude Code | Copilot CLI |
|---------|-------------|-------------|
| Custom slash commands | ✅ Native `/command_name` | ❌ Ask Copilot to read file |
| Command arguments | ✅ `/command arg1 arg2` | Describe in natural language |
| Agent spawning | ✅ Automatic by commands | ✅ By name in conversation |
| Model selection | ✅ Per-command via frontmatter | Controlled by `/model` |
| `$ARGUMENTS` variable | ✅ Passes text after command | N/A |

---

## Tips

1. **Tab completion.** Type `/` then Tab to see all available commands.

2. **Pass context as arguments.** `/create_plan_nt thoughts/shared/tickets/TICKET-123.md` reads the ticket and plans from it.

3. **Chain workflows.** After `/implement_plan` completes, run `/commit` then `/describe_pr` to ship.

4. **Opus for planning, Sonnet for research.** The toolkit automatically uses the right model — Opus for complex planning commands, Sonnet for focused agent work.

5. **Use `_nt` variants first.** They work without any setup. Graduate to full variants when you set up `thoughts/`.

---

## Practical Guides

The workflow guides apply to both Claude Code and Copilot CLI — just use `/slash_commands` directly instead of asking the AI to read files:

- **[Building a SaaS from Scratch](GUIDE-BUILD-SAAS.md)** — Replace "Read .claude/commands/X.md..." with `/X`
- **[Working with Existing Codebases](GUIDE-EXISTING-CODEBASES.md)** — Same substitution
