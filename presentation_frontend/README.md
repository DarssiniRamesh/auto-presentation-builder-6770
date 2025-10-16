# Demand Planning Deck (Slidev)

Professional, table-forward Slidev deck with reusable Vue components and corporate styling.

## Quick Start

- pnpm install
- pnpm dev
- Visit http://localhost:3000

Press `S` for presenter mode to view speaker notes.

## Editing

- Main content: [slides.md](./slides.md)
- Reusable layouts: `components/`
  - TitleCover.vue
  - KPIGrid.vue
  - TwoColTable.vue
  - FullTable.vue
  - RiskMatrix.vue
  - TimelineSteps.vue
- Styling: `style.css` → `theme/custom.css` (Ocean Professional palette)

## Export to PDF

- Preview: `pnpm dev` then visit http://localhost:3000
- Export (headless Chromium): `pnpm export`
  - Slidev will export to `dist/export.pdf`
  - Ensure fonts are embedded (Inter/Segoe UI fallback) and no hover-only styles affect print
- Troubleshooting:
  - If headers overlap in PDF, we disable sticky headers for print via `@media print`.
  - Ensure minimum font sizes: 14px body, 18px table headers.

## Accessibility & Conventions

- Table headers include `scope="col"`.
- Numeric columns are right-aligned using `.is-num` and tabular numerals.
- Contrast and font sizes follow corporate defaults for readability.
- Avoid hard-coding dates in slides; use props to pass values for export stability.

## Notes

- Vite dev server is configured on port 3000 in `vite.config.ts`.
- Use Node.js 20.x for local builds to match CI.
- No external services or API keys required.
- Deck structure and content derived from a CRM demand planning context; replace placeholders with your data as needed.

Learn more about Slidev at the [documentation](https://sli.dev/).
