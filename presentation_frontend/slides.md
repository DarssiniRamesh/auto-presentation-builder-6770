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
  Styled with Ocean Professional palette.
  Source: "CRM Application Demand, Resource, and Costing Plan" (extracted summary).
---

# Demand Planning Overview
<div class="title-slide with-hero-glow">
  <div>
    <h2 class="text-hero">CRM Application Demand, Resource, and Costing Plan</h2>
    <p class="subtitle text-md">Customer360 • Service Requests • Workflow • Omni-channel • BOT • Analytics • Security</p>
    <div class="subtitle text-xs">Prepared: {{ new Date().toLocaleDateString() }}</div>
  </div>
</div>

Notes:
- Introduce purpose: align demand, capacity, and budget for CRM multi-service delivery.
- Emphasize Ocean Professional look: clean cards, subtle gradients, blue accents.

---

# Current Demand Context
<div class="card-grid three mt-2">
  <div class="problem-card">
    <div class="eyebrow">Scope</div>
    <ul class="points-clean">
      <li>9+ services: Customer360, Service Requests, Workflow, Omni Channel, BOT, Reporting, SysAdmin/Security, API Gateway, Mobile/Offline</li>
      <li>Application DB, cross-cutting Security & Compliance</li>
      <li>SEBI-compliant security, auditability, DR/BCP</li>
    </ul>
  </div>
  <div class="problem-card">
    <div class="eyebrow">Drivers</div>
    <ul class="points-clean">
      <li>Omni-channel case intake and IGMS integration</li>
      <li>RBAC, encryption at rest/in transit, audit trails</li>
      <li>Mobile/offline secure sync and analytics reporting</li>
    </ul>
  </div>
  <div class="problem-card">
    <div class="eyebrow">Assumptions</div>
    <ul class="points-clean">
      <li>Complexity points → PD (Small=3, Med=8, Large=20, XL=40)</li>
      <li>Integrations via SOA APIs; no direct external DB access</li>
      <li>Contingency: 15% (Build/Integration/Hardening), 10% (UAT/Go-live)</li>
    </ul>
  </div>
</div>

Notes:
- Document maps module demand using weighted complexity points.
- Compliance and integrations are first-class NFRs shaping demand.

---

# Forecasting Approach
<div class="grid-2 mt-2">
  <div class="card">
    <div class="eyebrow">Methods & Cadence</div>
    <ul class="points-clean">
      <li>Point-based estimation converted to person-days (PD) and FTE-months</li>
      <li>Phase-based planning: P1 Discovery → P6 Go-live (~22 weeks total)</li>
      <li>Rolling updates at phase gates with contingency buffers</li>
    </ul>
  </div>
  <div class="card">
    <div class="eyebrow">Data Inputs</div>
    <ul class="points-clean">
      <li>Work items + OpenAPI specs per service</li>
      <li>Security/Compliance controls, integration touchpoints</li>
      <li>Complexity per module (Total points ≈ 276)</li>
    </ul>
  </div>
</div>

Notes:
- Highlight conversion: 1 PD = 8 hours; 1 FTE mo ≈ 20 PD.
- Total calendar ~5–6 months based on scope breadth.

---

# Resource & Capacity Planning
<div class="split-cols mt-2">
  <div class="left">
    <div class="feature-card">
      <div class="eyebrow">Roles & Skills</div>
      <ul class="points-clean">
        <li>Architect; Backend (FastAPI) Sr/Mid; Frontend (React); Mobile (Flutter)</li>
        <li>Data/BI, DevOps/SRE, Security/Compliance, QA/Automation, UX/BA, PM</li>
      </ul>
    </div>
    <div class="feature-card">
      <div class="eyebrow">Allocation (Examples)</div>
      <ul class="points-clean">
        <li>Build dominates capacity across nine services</li>
        <li>Integration & Hardening cover security, audit, DR</li>
        <li>UAT for SEBI/internal compliance evidence & KT</li>
      </ul>
    </div>
  </div>
  <div class="right">
    <div class="card">
      <div class="eyebrow">Phase Cadence</div>
      <ul class="points-clean">
        <li>P1 Discovery: 2w — scope, contracts, security baseline</li>
        <li>P2 Build: 8w — feature dev, unit/component tests, RBAC/audit wiring</li>
        <li>P3 Integration: 4w — CTI/IVR, LDAP/AD SSO, IGMS, API Gateway</li>
        <li>P4 Hardening: 3w — perf, VAPT, DR runbooks, SIEM/SOC</li>
        <li>P5 UAT: 3w — audits, training, documentation</li>
        <li>P6 Go-live: 2w — cutover, hypercare</li>
      </ul>
    </div>
  </div>
</div>

Notes:
- Total FTE-months approx 53.7 across roles and phases.
- Capacity reflects blended seniority and integration complexity.

---

# Costing & Budget Implications
<div class="card-grid three mt-2">
  <div class="feature-card">
    <div class="eyebrow">Cost Drivers</div>
    <ul class="points-clean">
      <li>Role-based blended rates (e.g., Arch $120/hr, Sr Eng $90/hr)</li>
      <li>High-load phases: Build, Integration, Hardening</li>
      <li>Contingency added per phase (15%/10%)</li>
    </ul>
  </div>
  <div class="feature-card">
    <div class="eyebrow">Phase Roll-up (USD)</div>
    <ul class="points-clean">
      <li>Subtotal across phases: ~$576,260</li>
      <li>Contingency: ~$76,216</li>
      <li>Total Estimated Cost: ~$652,476</li>
    </ul>
  </div>
  <div class="feature-card">
    <div class="eyebrow">Module View (Indicative)</div>
    <ul class="points-clean">
      <li>XL (40 pt): Customer360, Service Requests, SysAdmin/Security</li>
      <li>L (20 pt): Workflow, Omni, BOT, Reporting, Mobile, DB, Security (x-cut)</li>
      <li>M (8 pt): API Gateway, Knowledge Base</li>
    </ul>
  </div>
</div>

Notes:
- Phase table converts FTE months to PD to cost using blended rates.
- Excludes infra and 3rd-party licensing (price separately).

---

# Risks, Assumptions, Mitigations
<div class="card-grid three mt-2">
  <div class="feature-card">
    <div class="eyebrow">Risks</div>
    <ul class="points-clean">
      <li>Integration complexity (Dialer/IGMS/LDAP)</li>
      <li>VAPT/compliance findings late in cycle</li>
      <li>Offline sync conflicts; reporting performance</li>
    </ul>
  </div>
  <div class="feature-card">
    <div class="eyebrow">Mitigations</div>
    <ul class="points-clean">
      <li>Early mocks, phased cut-ins, SLAs</li>
      <li>Embed Security lead; pre-UAT scans; P4 remediation buffer</li>
      <li>Conflict strategy, indexing/materialized views, export optimization</li>
    </ul>
  </div>
  <div class="feature-card">
    <div class="eyebrow">Assumptions/Exclusions</div>
    <ul class="points-clean">
      <li>SOA APIs only; no external DB access</li>
      <li>Licensing/infra excluded from engineering costs</li>
      <li>KB content creation beyond skeletons is out of scope</li>
    </ul>
  </div>
</div>

Notes:
- Maintain architecture governance and contract tests to reduce drifts.
- Bandwidth/payload optimizations for PWA/mobile.

---

# Next Steps & Timeline
<div class="timeline mt-2">
  <div class="time-node">
    <div class="time-dot"></div>
    <div class="time-card">
      <div class="eyebrow">Immediate</div>
      <ul class="points-clean">
        <li>Sign-off on scope, API contracts, security baseline</li>
        <li>Confirm phase plan, staffing, and budgets</li>
      </ul>
    </div>
  </div>
  <div class="time-node">
    <div class="time-dot"></div>
    <div class="time-card">
      <div class="eyebrow">Near-Term (P2–P3)</div>
      <ul class="points-clean">
        <li>Build features; enable RBAC/audit; initial dashboards</li>
        <li>Integrate CTI/IVR, SSO, IGMS, API Gateway</li>
      </ul>
    </div>
  </div>
  <div class="time-node">
    <div class="time-dot future"></div>
    <div class="time-card">
      <div class="eyebrow">P4–P6</div>
      <ul class="points-clean">
        <li>Hardening: performance, VAPT fixes, DR/BCP</li>
        <li>UAT, audits, KT; Go-live cutover + hypercare</li>
      </ul>
    </div>
  </div>
</div>

Notes:
- Total calendar ≈ 22 weeks (5–6 months).
- Track milestones via phase gates and report variances early.
