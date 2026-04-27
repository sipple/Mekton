# Task Context: Mekton RPG V2 Rewrite

Session ID: 2026-04-27-mekton-v2-rewrite
Created: 2026-04-27T13:00:00Z
Status: in_progress
Current Phase: 1 (Skeleton) — PENDING TaskManager breakdown

## Current Request

Rewrite the Mekton RPG character/mecha creator from Rails 2.3.5 to Rails 8.
Execute in independent, reviewable phases. Each phase = feature branch → PR into `mekton-v2` → merge → next phase.

## Context Files (Standards to Follow)

- `.opencode/context/project-intelligence/technical-domain.md` — Target stack & conventions (Rails 8, Turbo, Stimulus, SQLite, Tailwind)
- `.opencode/context/core/standards/code-quality.md` — Code quality standards (load before any code work)

## Reference Files (Source Material — NOT implementation patterns)

- `app/models/` (37 files) — RPG calculation logic to PRESERVE (weight, cost, maneuver_pool, etc.)
- `db/schema.rb` — Authoritative data model (37 tables)
- `db/seed_data/` — CSV seed files
- `app/views/` (86 ERB files) — UX layout reference (inline-editing sheet structure)
- `config/routes.rb` — Resource hierarchy to replicate
- `public/javascripts/lib/characters/show.js` — Inline-editing UX behavior reference
- `public/javascripts/lib/mechas/show.js` — Inline-editing UX behavior reference
- `public/stylesheets/default.css` — Layout/styling reference (replaced by Tailwind)

## Target Stack

| Layer | Technology |
|-------|-----------|
| Framework | Rails 8 |
| Database | SQLite |
| JS | importmap-rails (no Node) |
| Hotwire | turbo-rails, stimulus-rails |
| CSS | Tailwind CSS 4 |
| Auth | Devise + Pundit |
| Testing | Minitest (Rails default) + system tests |

## Branch Strategy

```
master ───────────────────────────────────────────── (original Rails 2.3.5)
  └── mekton-v2 ──────────────────────────────────── (rewrite integration branch)
        ├── phase-1-skeleton ─── PR → mekton-v2
        ├── phase-2-auth ─────── PR → mekton-v2
        ├── phase-3-characters ─ PR → mekton-v2
        ├── phase-4-mechas ───── PR → mekton-v2
        └── phase-5-polish ───── PR → mekton-v2
```

## Full Phase Plan

### Phase 1 — Skeleton
**Goal**: Bootable Rails 8 app with empty database, seed data loading.
**Branch**: `phase-1-skeleton` off `mekton-v2`
**Deliverables**:
- `rails new` with correct flags (SQLite, Tailwind, importmap)
- Gemfile: turbo-rails, stimulus-rails, tailwindcss-rails
- config/database.yml → SQLite
- Initial migrations: port all 37 tables from old db/schema.rb
- db/seeds.rb: port CSV seed data loading
- models: port all 37 models with RPG math, fix SQL injection, add `scope` (not `named_scope`)
- Home controller: root route to a placeholder landing page
- Verify: `rails db:migrate`, `rails db:seed`, server boots, `/` loads

### Phase 2 — Auth
**Goal**: Devise authentication with Pundit authorization. User model with admin boolean.
**Branch**: `phase-2-auth` off `mekton-v2` (after Phase 1 merged)
**Deliverables**:
- Devise gem, User model with `admin:boolean`
- Devise views styled with Tailwind
- Pundit gem, ApplicationPolicy, UserPolicy
- Sign up, sign in, sign out flows
- Admin flag: admins can see/edit all records
- Verify: register, login, logout, admin flag works

### Phase 3 — Character CRUD
**Goal**: Full character sheet with inline editing via Turbo Streams. Users own their characters.
**Branch**: `phase-3-characters` off `mekton-v2` (after Phase 2 merged)
**Deliverables**:
- Character + all child models: add `belongs_to :user`
- All character controllers with strong params, Turbo Stream responses for edits
- Pundit policies: owner or admin only (scope, show, edit, update, destroy)
- Inline editing: click stat → Turbo Stream replace → reactive derived stat updates
- Add/delete items (skills, weapons, armor, equipment) via Turbo Stream append/remove
- Character index scoped to current_user (or all for admin)
- Verify: create character, edit stats inline, derived stats update, add/remove items

### Phase 4 — Mecha CRUD
**Goal**: Full mecha sheet with inline editing. Users own their mechas. Mechas belong to characters.
**Branch**: `phase-4-mechas` off `mekton-v2` (after Phase 3 merged)
**Deliverables**:
- Mecha + all child models: add `belongs_to :user`
- All mecha controllers with strong params, Turbo Stream responses
- Pundit policies: owner or admin only
- Inline editing: click field → Turbo Stream replace → reactive weight/cost/MV/MA updates
- Add/delete servos, weapons, shields, etc. via Turbo Stream
- Mecha index scoped to current_user
- Mecha → Character association preserved
- Verify: create mecha, edit fields, reactive stats update, add/remove components

### Phase 5 — Polish
**Goal**: Production-ready, old code archived, comprehensive tests.
**Branch**: `phase-5-polish` off `mekton-v2` (after Phase 4 merged)
**Deliverables**:
- Navigation: link between characters/mechas, header/footer
- Tailwind styling: full character sheet and mecha sheet visually complete
- System tests: inline editing flows, auth flows, authorization enforcement
- Edge cases: destroy cascades, empty states, validation errors
- Archive or remove old Rails 2.3.5 directories (app/, config/, public/, lib/ — keep db/seed_data/)
- Verify: full test suite green, all flows work end-to-end

## Constraints

- **Stimulus only when Turbo can't handle it** — prefer Turbo Frames + Streams
- **No jQuery** — zero jQuery in importmap pins
- **SQLite only** — no MySQL/PostgreSQL dependencies
- **Strong params mandatory** — no mass assignment
- **Parameterized queries** — no string interpolation in ActiveRecord conditions
- **Each phase must be independently reviewable and functional**
- **Current app (Rails 2.3.5) remains on `master` untouched**

## Exit Criteria (Overall)

- [ ] Phase 1: Rails 8 app boots, seeds work
- [ ] Phase 2: Devise auth + Pundit authorization working
- [ ] Phase 3: Full character sheet with inline editing, user-scoped
- [ ] Phase 4: Full mecha sheet with inline editing, user-scoped
- [ ] Phase 5: Polished, tested, old code archived
