<script setup lang="ts">
const props = defineProps<{
  title?: string
  steps: Array<{ phase: string; dates: string; owner: string; status: string }>
  caption?: string
}>();
</script>

<template>
  <section class="timeline-steps" role="group" :aria-label="title || 'Timeline and next steps'">
    <header v-if="title" class="ts-title">{{ title }}</header>
    <div class="table-wrap">
      <table class="pro-table dense" role="table">
        <thead>
          <tr>
            <th scope="col">Phase</th>
            <th scope="col">Dates</th>
            <th scope="col">Owner</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(s, i) in steps" :key="i">
            <td>{{ s.phase }}</td>
            <td class="is-num">{{ s.dates }}</td>
            <td>{{ s.owner }}</td>
            <td>
              <span class="status" :class="statusClass(s.status)">{{ s.status }}</span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <small v-if="caption" class="caption muted">{{ caption }}</small>
  </section>
</template>

<script lang="ts">
export default {
  methods: {
    statusClass(st: string) {
      const s = (st || '').toLowerCase();
      if (/(done|complete|closed)/.test(s)) return 'ok';
      if (/(at risk|risk|blocked)/.test(s)) return 'risk';
      if (/(in progress|active|wip)/.test(s)) return 'wip';
      return 'tbd';
    },
  },
};
</script>

<style scoped>
.ts-title { font-weight: 800; font-size: clamp(20px, 2.2vw, 28px); margin-bottom: 8px; }
.table-wrap { overflow: auto; border: 1px solid var(--theme-border-subtle); border-radius: 6px; }
.pro-table { width: 100%; border-collapse: separate; border-spacing: 0; }
.pro-table.dense td, .pro-table.dense th { padding: 8px 10px; }
.pro-table thead th {
  position: sticky; top: 0; background: #F3F4F6; border-bottom: 1px solid var(--theme-border-subtle);
  font-weight: 700; font-size: 18px; text-align: left; color: var(--theme-text-primary);
}
.pro-table tbody tr:nth-child(even) td { background: #FAFAFB; }
.is-num { text-align: right; font-variant-numeric: tabular-nums; }
.status {
  display: inline-flex; align-items: center; padding: 2px 8px; border-radius: 999px;
  font-size: 12px; font-weight: 700; letter-spacing: .02em;
  border: 1px solid var(--theme-border-subtle); background: #fff;
}
.status.ok { color: #166534; background: #ecfdf5; border-color: #a7f3d0; }
.status.wip { color: #92400e; background: #fffbeb; border-color: #fcd34d; }
.status.risk { color: #991b1b; background: #fef2f2; border-color: #fecaca; }
.status.tbd { color: #334155; background: #f1f5f9; border-color: #cbd5e1; }
.caption { margin-top: 6px; display: inline-block; font-size: 12px; }
@media print {
  .table-wrap { overflow: visible; }
  .pro-table thead th { position: static; }
}
</style>
