<!-- Context: project-intelligence/nav | Priority: high | Version: 2.0 | Updated: 2026-04-27 -->

# Project Intelligence — Mekton RPG

> Mekton character/mecha creator: Rails 8 rewrite from Rails 2.3.5.

## Structure

```
.opencode/context/project-intelligence/
├── navigation.md              # This file - quick overview
├── technical-domain.md        # ✅ POPULATED: Target stack (Rails 8, Turbo, SQLite, Tailwind)
├── business-domain.md         # ⚠️ Template — RPG/character-sheet domain
├── business-tech-bridge.md    # ⚠️ Template
├── decisions-log.md           # ⚠️ Template
└── living-notes.md            # ⚠️ Template
```

## Quick Routes

| What You Need | File | Status |
|---------------|------|--------|
| **Target tech stack & conventions** | `technical-domain.md` | ✅ Rails 8, Turbo, Stimulus, SQLite, Tailwind |
| **Inline-editing UX pattern** | `technical-domain.md` § Turbo Conventions | ✅ Turbo Streams replacing jQuery jeditable |
| **RPG rules reference** | `app/models/` (current codebase) | 📂 Preserved from old app |
| **Data model** | `db/schema.rb` (current codebase) | 📂 37 tables to port |
| **Seed data** | `db/seed_data/` (current codebase) | 📂 CSV files to port |
| Business domain context | `business-domain.md` | ⚠️ Template — needs RPG context |
| Decision history | `decisions-log.md` | ⚠️ Template |

## Usage

**New Team Member / Agent**:
1. Start with `navigation.md` (this file)
2. Read all files in order for complete understanding
3. Follow onboarding checklist in each file

**Quick Reference**:
- Business focus → `business-domain.md`
- Technical focus → `technical-domain.md`
- Decision context → `decisions-log.md`

## Integration

This folder is referenced from:
- `.opencode/context/core/standards/project-intelligence.md` (standards and patterns)
- `.opencode/context/core/system/context-guide.md` (context loading)

See `.opencode/context/core/context-system.md` for the broader context architecture.

## Maintenance

Keep this folder current:
- Update when business direction changes
- Document decisions as they're made
- Review `living-notes.md` regularly
- Archive resolved items from decisions-log.md

**Management Guide**: See `.opencode/context/core/standards/project-intelligence-management.md` for complete lifecycle management including:
- How to update, add, and remove files
- How to create new subfolders
- Version tracking and frontmatter standards
- Quality checklists and anti-patterns
- Governance and ownership

See `.opencode/context/core/standards/project-intelligence.md` for the standard itself.
