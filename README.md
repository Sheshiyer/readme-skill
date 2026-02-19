<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=200&text=/readme&fontSize=60&fontAlignY=35&desc=Visual%20Storytelling%20Engine%20for%20Codebases&descAlignY=55&fontColor=ffffff" width="100%" />

<!-- readme-gen:start:badges -->
![Craft Agent Skill](https://img.shields.io/badge/Craft_Agent-Skill-8B5CF6?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJ3aGl0ZSI+PHBhdGggZD0iTTEyIDJMMiA3bDEwIDUgMTAtNS0xMC01ek0yIDE3bDEwIDUgMTAtNU0yIDEybDEwIDUgMTAtNSIvPjwvc3ZnPg==)
![Claude Code Compatible](https://img.shields.io/badge/Claude_Code-Compatible-F97316?style=flat-square)
![License: MIT](https://img.shields.io/badge/License-MIT-22C55E?style=flat-square)
<!-- readme-gen:end:badges -->

<br>

**Auto-generate modern, visually rich READMEs by scanning your repo — not from templates, but from genuine understanding of your codebase.**

</div>

---

## What This Does

Most README generators ask you to fill out a form. This skill **scans your entire repository**, understands its personality, and crafts a README that reads like a landing page — not a technical report.

<table>
<tr>
<td width="50%" valign="top">

### Repo-Aware
Scans package manifests, CI configs, test suites, directory structure, and git history to understand what your project actually is.

</td>
<td width="50%" valign="top">

### Personality-Driven
Detects if your project is a CLI tool, web app, API, library, DevOps infra, monorepo, or ML project — and tailors every visual choice accordingly.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### Visually Rich
Capsule Render heroes, skillicons.dev tech stacks, shields.io badges, Mermaid architecture diagrams, unicode health scorecards, and ASCII art fallbacks.

</td>
<td width="50%" valign="top">

### Smart Updates
Merge mode preserves your hand-written sections while updating generated ones. Detects major refactors and regenerates from scratch with a backup.

</td>
</tr>
</table>

---

## Installation

### For Craft Agent

Copy the `SKILL.md` and `icon.svg` into your workspace skills directory:

```bash
mkdir -p ~/.craft-agent/workspaces/<your-workspace>/skills/readme
cp SKILL.md icon.svg ~/.craft-agent/workspaces/<your-workspace>/skills/readme/
```

### For Claude Code (SDK)

Place the `SKILL.md` in your project's `.claude/skills/` directory:

```bash
mkdir -p .claude/skills/readme
cp SKILL.md .claude/skills/readme/
```

### Optional: Freshness Hooks

Copy the hooks for automated README staleness detection:

```bash
# Push counter hook script
cp readme-push-counter.sh ~/.craft-agent/workspaces/<your-workspace>/scripts/

# Merge hooks.json into your existing hooks config
# (or copy directly if you don't have one)
cp hooks.json ~/.craft-agent/workspaces/<your-workspace>/hooks.json
```

---

## Usage

```
/readme                          # Scan current repo, generate README
/readme /path/to/repo            # Scan specific repo
/readme --style terminal         # ASCII art hero, hacker aesthetic
/readme --style minimal          # Clean, no visual chrome
/readme --update                 # Smart merge into existing README
/readme --contributing           # Also generate CONTRIBUTING.md
/readme --badges for-the-badge   # Override badge style
```

## How It Works

```
Phase 1: Deep Scan        → 30+ signals extracted from your repo
Phase 2: Classify          → Detect project personality (CLI/Web/API/Lib/etc.)
Phase 2.5: Interview       → 3-4 context-aware questions (not generic!)
Phase 3: Compose           → Assemble visual components
Phase 4: Write             → README.md + optional CONTRIBUTING.md
```

### Visual Components

| Component | Description |
|-----------|-------------|
| **Hero Block** | Capsule Render gradient wave (primary) or ASCII art via pyfiglet (fallback) |
| **Badge Bar** | Curated shields.io badges — only shows what your repo actually has |
| **Tech Stack** | skillicons.dev visual icon pills |
| **Features Grid** | HTML table layout with emoji headers |
| **Architecture** | Auto-generated Mermaid diagram from directory scan |
| **Health Scorecard** | Unicode progress bars for tests, CI, types, docs, coverage |
| **Section Dividers** | Capsule Render thin gradient SVGs |
| **Footer** | Inverted wave with contributor link |

### Smart Update Mode

Re-running `/readme --update` detects whether to **merge** or **regenerate**:

- **Merge**: Updates only generated sections (wrapped in `<!-- readme-gen:start/end -->` markers), preserves your hand-written content
- **Regenerate**: Triggered when major refactors are detected (language migration, framework swap, monorepo conversion). Backs up existing README first

### Monorepo Support

Detects pnpm/lerna/nx/turbo/Cargo/Go workspaces and generates:
- Root README with package overview table + dependency graph
- Optional per-package READMEs (asked during interview)

### Automated Freshness Hooks

Two hooks keep your README from going stale:

1. **Push Counter** — After 5 `git push` commands, nudges you to run `/readme --update`
2. **Weekly Cron** — Every Monday at 10 AM, checks for new releases/tags and structural changes

---

## Files

```
readme/
├── SKILL.md                    # Skill definition (580+ lines)
├── icon.svg                    # Custom doc-with-paintbrush icon
├── hooks.json                  # Freshness hook configuration
├── readme-push-counter.sh      # Push counter script for hooks
└── README.md                   # This file
```

---

## License

MIT

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=100&section=footer" width="100%" />

**Built by [Sheshiyer](https://github.com/Sheshiyer) with Craft Agent**

</div>
