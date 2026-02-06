# Building a SaaS from Scratch with AI Dev Toolkit

A practical, step-by-step guide to building a SaaS product from an empty repository using AI agents and commands with GitHub Copilot CLI.

> **Using Claude Code instead?** See [README-CLAUDE-CODE.md](README-CLAUDE-CODE.md) — commands work as native `/slash_commands` there.

---

## How to Use This Toolkit in Copilot CLI

**Agents** are loaded automatically. Use them by name in conversation:
```
Use codebase-locator to find all API routes
```

**Commands** are workflow templates. Invoke them by asking Copilot to follow the file:
```
Read .claude/commands/create_plan_nt.md and follow those instructions
```

Or describe what you want and Copilot will use the right workflow:
```
Create a detailed implementation plan for adding user authentication
```

Some commands may be available as skills — run `/skills list` to check.

---

## Phase 1: Project Bootstrap

### 1.1 Initialize and Install the Toolkit

```bash
mkdir my-saas && cd my-saas
git init

# Copy the toolkit
cp -r /path/to/AI-Dev-toolkit/.claude .

# Set up the knowledge base
mkdir -p thoughts/shared/{research,plans,prs,tickets}
echo "thoughts/searchable/" >> .gitignore

git add .claude/ thoughts/ .gitignore
git commit -m "Add AI Dev Toolkit"
```

### 1.2 Research Your Tech Stack

Before writing code, use the web researcher to make informed decisions:

```
Use web-search-researcher to compare Next.js vs Remix vs SvelteKit
for a SaaS product with authentication, billing, and team management
```

Then research specific tooling:

```
Use web-search-researcher to find the best auth libraries for Next.js
in 2026 — compare NextAuth, Clerk, and Lucia
```

The agent returns synthesized findings with source links so you can make grounded decisions.

### 1.3 Create Your Architecture Plan

Ask Copilot to run the planning workflow:

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
I want to build a project management SaaS with user auth, team workspaces,
task boards, and Stripe billing. Use Next.js, PostgreSQL, Prisma,
and Tailwind CSS.
```

The workflow will:
1. Ask clarifying questions about scope and constraints
2. Research patterns for the technologies you chose
3. Create a phased implementation plan
4. Save it as a structured document

**Output:** `thoughts/shared/plans/YYYY-MM-DD-project-setup.md`

---

## Phase 2: Foundation

### 2.1 Implement the Foundation Plan

```
Read .claude/commands/implement_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-project-setup.md
```

This workflow reads the plan and implements it phase by phase. For each phase it:
- Makes the code changes
- Runs automated checks (tests, linting, build)
- **Pauses for you to manually verify** before continuing

You stay in control. If something doesn't look right, tell it and it adjusts.

### 2.2 Commit Your Work

After each phase or logical chunk:

```
Read .claude/commands/commit.md and follow those instructions
```

The workflow reviews all changes, groups related files, proposes descriptive commit messages, and waits for your approval. Commits are authored by you — no AI attribution.

### 2.3 Iterate on the Plan

Requirements change. Ask Copilot to run the iterate workflow:

```
Read .claude/commands/iterate_plan_nt.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-project-setup.md.
Add Redis for session caching and rate limiting.
```

The workflow reads the existing plan, researches what needs to change, and makes surgical edits while preserving the rest.

---

## Phase 3: Core Features

For each major feature, follow this cycle:

### 3.1 Research → Plan → Implement → Ship

**Step 1: Research existing patterns**

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Research how authentication is currently structured.
```

This spawns parallel agents to analyze your codebase and produces a research document with file:line references.

**Step 2: Plan the feature**

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Add Stripe billing with subscription tiers: Free, Pro ($20/mo),
and Team ($50/mo per seat). Include checkout, customer portal,
and webhook handling.
```

**Step 3: Implement**

```
Read .claude/commands/implement_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-stripe-billing.md
```

**Step 4: Validate**

```
Read .claude/commands/validate_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-stripe-billing.md
```

This checks implementation against the plan — verifies each phase is complete, runs automated tests, and lists what needs manual testing.

**Step 5: Commit and PR**

```
Read .claude/commands/commit.md and follow those instructions
```

```
Read .claude/commands/describe_pr.md and follow those instructions
```

### 3.2 Recommended Feature Build Order

For a typical SaaS, build features in this order:

| Order | Feature | Workflow |
|-------|---------|----------|
| 1 | Project scaffolding + CI | Plan → Implement |
| 2 | Database schema + ORM | Plan → Implement |
| 3 | Authentication | Research → Plan → Implement |
| 4 | Core data models + CRUD | Plan → Implement |
| 5 | Team/workspace management | Research existing auth patterns first |
| 6 | Billing (Stripe) | Use `web-search-researcher` for latest Stripe API |
| 7 | Dashboard + UI | Use `codebase-pattern-finder` to follow existing UI patterns |
| 8 | Email notifications | Research existing patterns first |
| 9 | API for integrations | Use `codebase-pattern-finder` for route patterns |
| 10 | Admin panel | Follow all established patterns |

For each feature, always research the codebase first. As your project grows, the agents become more valuable because they find the patterns you've already established.

---

## Phase 4: Quality and Polish

### 4.1 Use Agents for Consistency Checks

As your codebase grows, use agents to ensure consistency:

```
Use codebase-pattern-finder to show all error handling patterns
in the codebase
```

```
Use codebase-analyzer to trace the complete request lifecycle
from API route to database and back
```

If you spot inconsistencies, create a plan to fix them:

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Standardize error handling across all API routes to use the pattern
in src/lib/errors.ts
```

### 4.2 Document Architecture Decisions

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Document the complete authentication architecture including session
management, role-based access, and team permissions.
```

This creates a research document that future you (or teammates) can reference.

---

## Phase 5: Shipping and Maintenance

### 5.1 PR Workflow

For every feature branch:

```bash
git checkout -b feature/billing
```

Work with Copilot to plan, implement, and commit, then:

```
Read .claude/commands/describe_pr.md and follow those instructions
```

This analyzes the git diff, reads related plans/research, and generates a comprehensive PR description with context, changes, and testing instructions.

### 5.2 Session Handoffs

Working across multiple sessions? Save your context:

```
Read .claude/commands/create_handoff.md and follow those instructions
```

This creates a handoff document capturing:
- What you were working on and its status
- Key files changed with line references
- Learnings and gotchas discovered
- Next steps

Resume in a new session:

```
Read .claude/commands/resume_handoff.md and follow those instructions.
The handoff is at thoughts/shared/handoffs/TICKET/YYYY-MM-DD_handoff.md
```

The workflow reads the handoff, validates the current state, and picks up where you left off.

---

## Workflow Cheat Sheet

```
┌──────────────────────────────────────────────────────┐
│                    BUILD CYCLE                        │
│                                                      │
│  Research ──→ Plan ──→ Implement ──→ Validate        │
│     │          │          │            │              │
│  research_   create_    implement_   validate_        │
│  codebase_nt plan_nt    plan         plan             │
│                                                      │
│           ──→ Commit ──→ PR ──→ Ship                 │
│                │         │                           │
│             commit    describe_pr                     │
└──────────────────────────────────────────────────────┘
```

### When to Use Which Agent

| You Need To... | Use This |
|----------------|----------|
| Find where something is | `codebase-locator` |
| Understand how something works | `codebase-analyzer` |
| See how to follow existing patterns | `codebase-pattern-finder` |
| Research external tools/APIs | `web-search-researcher` |
| Find past research/plans | `thoughts-locator` |
| Get key takeaways from a doc | `thoughts-analyzer` |

### When to Use Which Command

| You Need To... | Command File |
|----------------|-------------|
| Plan a new feature | `create_plan_nt` or `create_plan` |
| Build a planned feature | `implement_plan` |
| Update a plan | `iterate_plan_nt` or `iterate_plan` |
| Check implementation | `validate_plan` |
| Research your codebase | `research_codebase_nt` |
| Commit changes | `commit` |
| Create PR description | `describe_pr` |
| Save work-in-progress context | `create_handoff` |
| Resume saved work | `resume_handoff` |

---

## Tips for Building Faster

1. **Always research before planning.** Even for new features, the research workflow finds patterns you've already established so the AI doesn't reinvent the wheel.

2. **Let plans be living documents.** Use the iterate workflow freely. Plans should evolve as you learn.

3. **Commit often.** Use the commit workflow after each phase of implementation. Small, descriptive commits make debugging easier.

4. **Use agents conversationally.** Between workflows, talk to agents directly: *"Use codebase-analyzer to explain what this middleware does."*

5. **Save handoffs before closing.** If you're mid-feature, the handoff workflow saves hours of re-context next session.

6. **Build patterns early.** Invest in good patterns for your first 2-3 features. The AI will replicate them across all future features via `codebase-pattern-finder`.
