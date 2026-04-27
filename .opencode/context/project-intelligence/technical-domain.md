<!-- Context: project-intelligence/technical | Priority: critical | Version: 1.0 | Updated: 2026-04-27 -->

# Technical Domain — Mekton RPG

**Purpose**: Target architecture and conventions for the Rails 8 rewrite.
**Current app (Rails 2.3.5)** is the functional spec, NOT an implementation pattern.

## Primary Stack

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| Framework | Rails 8 | Latest conventions, built-in SQLite adapter |
| Ruby | 3.3+ | Required for Rails 8 |
| Database | SQLite | Single-user app, no concurrency needs |
| JS Bundling | importmap-rails | No Node.js dependency, pin from CDN |
| Hotwire | turbo-rails, stimulus-rails | Replace jQuery/jeditable UIs |
| CSS | Tailwind CSS 4 | Utility-first, replaces hand-written CSS |
| Auth | None (single-user/hobby app) | No user accounts needed |

## Architecture

```
Type: Rails monolith (standard MVC)
Frontend: Turbo Drive + Turbo Frames + Turbo Streams
JS enhancers: Stimulus controllers (only when Turbo can't handle it)
```

### Why This Architecture
- Single developer, no team — keep it simple
- No async jobs, no Redis, no background processing needed
- SQLite eliminates database setup entirely (file-based)
- importmap eliminates Node.js toolchain
- Turbo handles 90% of interactivity without custom JS

## Key Technical Decisions

| Decision | Rationale |
|----------|-----------|
| Greenfield rewrite, not upgrade | Rails 2.3→8 gap is too large for incremental |
| Turbo Streams for inline editing | Replaces jQuery jeditable AJAX pattern |
| Stimulus only when necessary | Turbo Frames/Streams handle most interactivity |
| No Sprockets, no esbuild | importmap for JS, tailwindcss-rails for CSS |
| SQLite only | Removes MySQL dependency, zero-config |
| Current codebase = spec | Ruby logic in models preserved, everything else rewritten |

## Project Structure (Target)

```
app/
├── controllers/     # RESTful, Turbo Stream responses
├── models/          # RPG math preserved from old app
├── views/           # ERB + Turbo Frame partials
├── helpers/         # View helpers (editable fields, stat display)
├── javascript/
│   └── controllers/ # Stimulus (only where Turbo can't reach)
└── assets/
    └── stylesheets/ # Tailwind (application.tailwind.css)
config/
├── routes.rb        # resources with nesting
└── database.yml     # SQLite only
db/
├── migrate/         # New migrations (schema from old schema.rb)
├── schema.rb
├── seeds.rb         # CSV seed data (ported from old db/seed_data/)
└── seed_data/       # CSV files
lib/                 # RPG calculation modules (if extracted from models)
```

## Turbo Conventions (Mandatory)

### Turbo Frames — for page regions
```erb
<%%= turbo_frame_tag "character_stats" do %>
  <!-- Stats table -->
<%% end %>
```
- Use frames to isolate editable regions
- Frame navigations replace content without full page reload
- Lazy-load frames with `src:` for deferred data

### Turbo Streams — for reactive updates
```ruby
# Controller responds to edit with turbo_stream
respond_to do |format|
  format.turbo_stream {
    render turbo_stream: turbo_stream.replace("character_stats",
      partial: "characters/character_stats", locals: { character: @character })
  }
end
```
- Inline edits → Turbo Stream `replace` or `update` on the affected partials
- After stat edit, stream updated derived stats to ALL affected divs
- Add item → `turbo_stream.append` new table row
- Delete item → `turbo_stream.remove` row

### Stimulus — last resort only
Use Stimulus ONLY when:
- Client-side state tracking is needed (e.g., "changed" indicators)
- Custom input behavior Turbo can't handle
- Third-party integration requires JS
- Complex select/dropdown with dynamic options

```javascript
// app/javascript/controllers/editable_field_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  // Minimal: just wire events, let Turbo Streams handle the response
}
```

## Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Models | PascalCase, snake_case file | `Character`, `MechaServo` |
| Controllers | PascalCase, plural | `CharactersController` |
| Views | snake_case, .html.erb | `show.html.erb`, `_character_stats.html.erb` |
| Partials | `_underscored.html.erb` | `_character_skills.html.erb` |
| Routes | RESTful, snake_case | `resources :characters` |
| DB tables | snake_case, plural | `character_armor_data` |
| CSS classes | Tailwind utility classes | `text-sm font-bold` |

## Code Standards

- **Strong params everywhere** — no `params[:model]` mass assignment
- **Parameterized queries** — no string interpolation in `where`/`find_by`
- **Turbo Stream responses** — controllers return `format.turbo_stream` for edits
- **Partial-first views** — every editable section is a partial for Turbo targeting
- **RPG logic in models** — `weight`, `cost`, `maneuver_pool` remain model methods
- **No jQuery** — zero jQuery dependencies in importmap

## Security Requirements

- **Strong parameters** on all create/update actions
- **Parameterized queries** only (ActiveRecord `where` with hash/array args)
- **CSRF protection** (built into Rails/Turbo)
- **No mass assignment** — `attributes=` only with permitted params
- **SQLite file permissions** — database file not web-accessible

## 📂 Codebase References

**Current app (functional spec — NOT implementation pattern)**:
- `app/models/` (37 files) — RPG calculation logic to preserve
- `db/schema.rb` — authoritative data model for new migrations
- `db/seed_data/` — CSV seed files to port
- `app/views/` (86 ERB files) — UX reference (inline-editing sheet layout)
- `config/routes.rb` — resource hierarchy to replicate
- `public/javascripts/lib/characters/show.js` — inline-editing UX reference

**Target (not yet built)**:
- New Rails 8 app will be generated in same repo root
- Gemfile, Procfile, config files per Rails 8 conventions

## Exit Criteria (Rewrite Complete When)

- [ ] All 37 models ported with RPG math intact, SQL injection fixed
- [ ] All CRUD routes working with Turbo Stream inline editing
- [ ] Character sheet: click-to-edit stats → reactive derived stat updates
- [ ] Mecha sheet: same inline-editing UX with reactive weight/cost/mv updates
- [ ] Add/delete items via Turbo Stream (no page reload)
- [ ] CSV seed data loads correctly into SQLite
- [ ] Zero jQuery dependencies
- [ ] Tailwind styled (142 lines of old CSS replaced)
- [ ] All tests passing (model + system tests for editing flows)
