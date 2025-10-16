<script setup lang="ts">
const props = defineProps<{
  title?: string
  items: Array<{ risk: string; impact: string; likelihood: string; mitigation: string }>
  caption?: string
}>();
</script>

<template>
  <section class="risk-matrix" role="group" :aria-label="title || 'Risk matrix'">
    <header v-if="title" class="rm-title">{{ title }}</header>
    <div class="table-wrap">
      <table class="pro-table dense" role="table">
        <thead>
          <tr>
            <th scope="col">Risk</th>
            <th scope="col">Impact</th>
            <th scope="col">Likelihood</th>
            <th scope="col">Mitigation</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(it, i) in items" :key="i">
            <td class="w-40">{{ it.risk }}</td>
            <td class="w-14 is-num">{{ it.impact }}</td>
            <td class="w-18 is-num">{{ it.likelihood }}</td>
            <td class="w-auto">{{ it.mitigation }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <small v-if="caption" class="caption muted">{{ caption }}</small>
  </section>
</template>

<style scoped>
.rm-title {
  font-weight: 800;
  font-size: clamp(20px, 2.2vw, 28px);
  margin-bottom: 8px;
}
.table-wrap {
  overflow: auto;
  border: 1px solid var(--theme-border-subtle);
  border-radius: 6px;
}
.pro-table { width: 100%; border-collapse: separate; border-spacing: 0; }
.pro-table.dense td, .pro-table.dense th { padding: 8px 10px; }
.pro-table thead th {
  position: sticky; top: 0; background: #F3F4F6; border-bottom: 1px solid var(--theme-border-subtle);
  font-weight: 700; font-size: 18px; text-align: left; color: var(--theme-text-primary);
}
.pro-table tbody tr:nth-child(even) td { background: #FAFAFB; }
.is-num { text-align: right; font-variant-numeric: tabular-nums; }
.w-40 { width: 40%; }
.w-18 { width: 18%; }
.w-14 { width: 14%; }
.w-auto { width: auto; }
.caption { margin-top: 6px; display: inline-block; font-size: 12px; }
@media print {
  .table-wrap { overflow: visible; }
  .pro-table thead th { position: static; }
}
</style>
