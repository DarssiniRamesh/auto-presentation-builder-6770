---
# Global deck settings
title: "Demand Planning Overview"
theme: default
mdc: true
class: text-left
transition: slide-left
fonts:
  sans: Inter, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica Neue, Arial
  mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace
css: |
  @import "./style.css";
info: |
  Table-forward, professional multi-layout deck using Ocean Professional palette.
  Source: "CRM Demand, Resource, and Costing Plan" (extracted summary).
---

<!-- Slide 1: Title Cover -->
<TitleCover
  title="Demand Planning Overview"
  subtitle="CRM Application Demand, Resource, and Costing Plan"
  :date="new Date().toLocaleDateString()"
  caption="Customer360 • Service Requests • Workflow • Omni-channel • BOT • Analytics • Security"
/>

Notes:
- State the goal: Align forecast demand with capacity, timing, and budget for CRM rollout.
- Introduce deck structure: KPIs, demand signals, resource plan, risks, timeline, next steps.

---

<!-- Slide 2: KPI Grid -->
<KPIGrid
  title="Key Performance Indicators"
  :columns="3"
  :kpis="[
    { label: 'Forecast Accuracy', value: '+/- 6-10%' , note: 'Monthly rolling' },
    { label: 'Bias', value: '+1.5%', delta: '-0.5pp MoM' },
    { label: 'MAPE', value: '12.4%', delta: '-0.8pp QoQ' },
    { label: 'Service Level', value: '96.5%', delta: '+0.7pp' },
    { label: 'Inventory Turns', value: '7.2x' },
    { label: 'Backorder Rate', value: '1.1%' }
  ]
  caption="Indicative targets; adjust per segment and seasonality."
/>

Notes:
- Keep KPI definitions crisp and consistent with the operating model.
- These values are representative; confirm baselines from current CRM reporting.

---

<!-- Slide 3: Two Column with Table -->
<TwoColTable
  heading="Process & Inputs"
  :bullets="[
    'Monthly S&OP cadence with weekly refresh',
    'Inputs: transactions, channels, market factors, seasonality',
    'Controls: RBAC, audit, and compliance checkpoints',
    'Outputs: forecast, staffing plan, inventory & service targets'
  ]
  tableTitle="Demand Signals and Governance"
  :columns="['Channel', 'Data Source', 'Frequency', 'Owner']"
  :rows="[
    ['Web', 'CRM Events / Orders', 'Daily', 'Sales Ops'],
    ['Contact Center', 'CTI / IVR / ACD', 'Hourly', 'Support Ops'],
    ['Field', 'Mobile App Sync', 'Daily', 'Field Lead'],
    ['Partner', 'EDI/API Feeds', 'Weekly', 'Alliances'],
    ['Marketing', 'Campaign / Web Analytics', 'Daily', 'Growth'],
    ['External', 'Market / Seasonality', 'Monthly', 'FP&A']
  ]
  caption="Ensure data quality SLAs and late-arriving data handling."
/>

Notes:
- Left column sets context: cadence and governance.
- Right table enumerates signals with frequency and owner for stewardship.

---

<!-- Slide 4: Full Width Resource Planning Table -->
<FullTable
  title="Resource Planning — Roles and Allocation (Illustrative)"
  :columns="['Role', 'FTE', 'Allocation %', 'Key Skills', 'Tooling']"
  :rows="[
    ['Solution Architect', '1.0', '80%', 'Domain, Integration, Security', 'Draw.io, Confluence'],
    ['Backend (API)', '3.0', '85%', 'FastAPI, AuthN/Z, Integrations', 'Python, Postman'],
    ['Frontend (Web)', '2.0', '80%', 'React, Accessibility', 'Vite, Jest'],
    ['Mobile (Flutter)', '1.0', '70%', 'Offline Sync, Perf', 'Flutter, Firebase Emulators'],
    ['Data/BI', '1.0', '60%', 'Modeling, Dashboards', 'SQL, Metabase'],
    ['QA/Automation', '2.0', '75%', 'Test Strategy, VAPT Prep', 'Playwright, OWASP ZAP'],
    ['DevOps/SRE', '1.0', '60%', 'Pipelines, DR/BCP', 'Docker, k8s, Grafana'],
    ['Security/Compliance', '0.5', '40%', 'Policies, Evidence, SIEM', 'Vault, SIEM'],
    ['UX/BA', '1.0', '65%', 'Research, Flows, Backlog', 'Figma, Jira'],
    ['PM', '1.0', '70%', 'Deliverables, Risks, Budget', 'Jira, Sheets']
  ]
  caption="Values are placeholders where the PDF did not specify exact counts; validate during Discovery."
/>

Notes:
- Compact, readable table; numeric columns right-aligned for scanning.
- Cross-functional coverage ensures integration and compliance readiness.

---

<!-- Slide 5: Risk Matrix -->
<RiskMatrix
  title="Risks and Mitigations"
  :items="[
    { risk: 'Data latency and quality across channels', impact: 'High', likelihood: 'Medium', mitigation: 'SLA-backed pipelines, late-data reforecast, dq dashboards' },
    { risk: 'Seasonality shifts vs. historical patterns', impact: 'Medium', likelihood: 'High', mitigation: 'Exogenous factors, short-term boosts, ensemble models' },
    { risk: 'Supply constraints affecting service levels', impact: 'High', likelihood: 'Medium', mitigation: 'Prioritization rules, safety stock, expedite paths' },
    { risk: 'Integration complexity (SSO/CTI/IGMS)', impact: 'High', likelihood: 'Medium', mitigation: 'Contract tests, phased cut-ins, mocks' },
    { risk: 'Compliance/VAPT findings late', impact: 'High', likelihood: 'Low', mitigation: 'Pre-UAT scans, dedicated hardening buffer' }
  ]
  caption="Track residual risk and mitigation owners per phase."
/>

Notes:
- Use the matrix for governance reviews; tag each risk to an owner and due date.
- Update likelihood/impact as telemetry improves.

---

<!-- Slide 6: Timeline / Next Steps -->
<TimelineSteps
  title="Timeline and Next Steps"
  :steps="[
    { phase: 'Discovery', dates: 'Weeks 1–2', owner: 'PM/BA', status: 'Done' },
    { phase: 'Modeling', dates: 'Weeks 3–4', owner: 'Data/Arch', status: 'In Progress' },
    { phase: 'Pilot', dates: 'Weeks 5–10', owner: 'Eng Leads', status: 'At Risk' },
    { phase: 'Rollout', dates: 'Weeks 11–22', owner: 'PM/Eng', status: 'TBD' }
  ]
  caption="Dates align to a ~22-week plan; refine per dependency readiness."
/>

Notes:
- Ensure each phase has entry/exit criteria and evidence.
- Use status chips for stakeholder clarity in review sessions.

---

<!-- Slide 7: Next Steps Table (if no explicit costing) -->
<FullTable
  title="Next Steps and Ownership"
  :columns="['Action', 'Owner', 'Due', 'Dependency']"
  :rows="[
    ['Confirm scope and baselines', 'PM', 'T+3 days', 'Steering sign-off'],
    ['Define data SLAs & dq rules', 'Data Lead', 'T+1 week', 'Owners per channel'],
    ['Lock API & integration contracts', 'Arch', 'T+2 weeks', 'Partner/SSO/CTI teams'],
    ['Finalize staffing and schedule', 'PM', 'T+1 week', 'Budget confirmation'],
    ['Agree KPI targets & reporting', 'Ops/FP&A', 'T+2 weeks', 'Data availability']
  ]
  caption="Replace T+X placeholders with calendar dates on approval."
/>

Notes:
- If costing is required, swap this slide with a Cost Summary table (One-time vs. Recurring).
- Keep footnotes minimal and focused on decisions and dependencies.
