<script setup lang="ts">
type TableCell = string | number
type Row = TableCell[]
// PUBLIC_INTERFACE
const props = withDefaults(defineProps<{
  heading?: string
  bullets?: string[]
  tableTitle?: string
  columns?: string[]
  rows?: Row[]
  caption?: string
}>(), {
  heading: '',
  bullets: () => [],
  tableTitle: '',
  columns: () => [],
  rows: () => [],
  caption: '',
});
const figId = `table-title-${Math.random().toString(36).slice(2, 8)}`
</script>

<template>
  <section class="two-col" role="group" :aria-label="heading || 'Summary and Table'">
    <div class="col left">
      <div class="section-eyebrow" v-if="heading">{{ heading }}</div>
      <ul v-if="bullets?.length" class="bullets">
        <li v-for="(b, i) in bullets" :key="i">{{ b }}</li>
      </ul>
      <slot />
    </div>
    <div class="col right">
      <figure class="table-figure">
        <figcaption v-if="tableTitle" :id="figId" class="table-title">{{ tableTitle }}</figcaption>
        <div class="table-wrap">
          <table class="pro-table" :aria-describedby="tableTitle ? figId : undefined" role="table">
            <thead>
              <tr>
                <th v-for="(c, i) in (columns || [])" :key="i" scope="col" :class="{'is-num': i>0 && String(c).toLowerCase().includes('%')}">
                  {{ c }}
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(r, rIdx) in (rows || [])" :key="rIdx">
                <td v-for="(cell, cIdx) in r" :key="cIdx" :class="numClass((columns || [])[cIdx], cell)">
                  {{ cell }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <small v-if="caption" class="caption muted">{{ caption }}</small>
      </figure>
    </div>
  </section>
</template>

<script lang="ts">
export default {
  methods: {
    numClass(header: string, cell: string | number) {
      const h = String(header || '').toLowerCase();
      const isNum = /%|rate|turns|level|fte|count|qty|days|hours|#|total|cost|allocation/.test(h);
      const looksNum = typeof cell === 'number' || /^[\d,.\-%]+$/.test(String(cell ?? ''));
      return { 'is-num': isNum || looksNum };
    },
  },
};
</script>

<style scoped>
.two-col {
  display: grid;
  grid-template-columns: 0.9fr 1.1fr;
  gap: 20px;
}
.col { display: grid; align-content: start; gap: 12px; }
.section-eyebrow {
  font-variant-caps: small-caps;
  letter-spacing: .08em;
  color: var(--theme-text-secondary);
  font-weight: 800;
  font-size: 12px;
}
.bullets { list-style: none; padding: 0; margin: 0; display: grid; gap: 8px; }
.bullets li {
  padding-left: 14px;
  position: relative;
  color: var(--theme-text-primary);
  line-height: 1.45;
}
.bullets li::before {
  content: "";
  position: absolute;
  top: .75em; left: 0;
  width: 6px; height: 6px; border-radius: 9999px;
  background: var(--theme-primary-400);
}
.table-figure { display: grid; gap: 8px; }
.table-title { font-weight: 700; color: var(--theme-text-primary); }
.table-wrap { overflow: auto; border-radius: 6px; border: 1px solid var(--theme-border-subtle); }
.pro-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  font-size: 16px;
}
.pro-table thead th {
  position: sticky;
  top: 0;
  background: #F3F4F6;
  color: var(--theme-text-primary);
  text-align: left;
  font-weight: 700;
  font-size: 18px;
  border-bottom: 1px solid var(--theme-border-subtle);
  padding: 10px;
}
.pro-table tbody td {
  padding: 8px 10px;
  border-bottom: 1px solid var(--theme-border-subtle);
  background: #fff;
}
.pro-table tbody tr:nth-child(even) td {
  background: #FAFAFB;
}
.pro-table th:first-child, .pro-table td:first-child { border-left: none; }
.pro-table th:last-child, .pro-table td:last-child { border-right: none; }
.is-num { text-align: right; font-variant-numeric: tabular-nums; }
.caption { font-size: 12px; }
@media (max-width: 1024px) {
  .two-col { grid-template-columns: 1fr; }
}
@media print {
  .table-wrap { overflow: visible; }
  .pro-table thead th { position: static; }
}
</style>
