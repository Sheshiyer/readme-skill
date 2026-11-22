# Temperance project rail

This directory is the **project-side** Temperance packet. It does not replace
the host operator runtime.

## Two layers

| Layer | Location | Owns |
|---|---|---|
| **Host TE** | `~/.temperance_engine`, `~/.config/opencode`, LaunchAgents | Models, OmniRoute, enrich plugins, budgets, combos |
| **Project rail** | `.temperance/`, `.planning/`, `ISA.md`, `AGENTS.md` | What work is next, acceptance, agent contract |

Chat sessions only *feel* like full TE when **both** layers are present for the cwd.

## Commands

```bash
temperance-project-init --cwd . --check
temperance-next-wave --cwd .
temperance-next-wave --write-tasks
temperance-batch --foreground --tasks .planning/next-wave-tasks.json --concurrency 4 --worktree
```

Never commit OmniRoute API keys, provider tokens, or home absolute secrets here.
