---
name: mipe-doctor
description: Diagnoses Mipe runtime and skill package state. Use when skills fail to load, mipe errors occur, or mipe workspace health check is requested.
---

# Workflow

1. Locate `.mipe/mipe.yml` relative to the workspace root
   - Missing: report "no skills declared", stop
2. Parse the `skills:` list
   - Flag malformed YAML, non-list `skills:`, blank entries
   - Flag entries that are not valid `registry/repository[:tag|@digest]` references
3. List `<agent_home>/skills/`
   - Missing: report "no skills installed", stop
4. Compare declared references against installed skill directories
   - Declared but not installed: pull or install likely failed
   - Installed but not declared: leftover from a previous `mipe.yml`
   - Installed but missing `SKILL.md`: failed structural validation
5. Inspect `/opt/mipe/cache/skills/sha256/` if present
   - Report entry count and total size
   - Flag digest directories that are empty or partially extracted
6. Report findings grouped by severity: error, warning, ok
   - Each finding: file path, condition, remediation

# Constraints

- Read-only. Never modify `mipe.yml`, the cache, or `<agent_home>/skills/`
- No network access. Do not resolve, pull, or reach a registry
- No guessing. Report only what is directly observable on disk
- One finding per line. No narrative summary paragraphs
