<script setup lang="ts">
type TableCell = string | number
type Row = TableCell[]
// PUBLIC_INTERFACE
const props = withDefaults(defineProps<{
  title?: string
  columns?: string[]
  rows?: Row[]
  caption?: string
}>(), {
  title: '',
  columns: () => [],
  rows: () => [],
  caption: '',
});
</script>

<template>
  <section class="full-table" role="group" :aria-label="title || 'Data table'">
    <header v-if="title" class="full-title">{{ title }}</header>
    <div class="table-wrap">
      <table class="pro-table dense" role="table">
        <thead>
          <tr>
            <th v-for="(c, i) in (columns || [])" :key="i" scope="col" :class="{'is-num': isNumericHeader(c)}">{{ c }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(r, idx) in (rows || [])" :key="idx">
            <td v-for="(cell, cIdx) in r" :key="cIdx" :class="cellClass((columns || [])[cIdx], cell)">{{ cell }}</td>
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
    isNumericHeader(h: string) {
      const s = String(h || '').toLowerCase();
      return /%|rate|turns|level|fte|count|qty|days|hours|#|total|cost|allocation|headcount/.test(s);
    },
    cellClass(header: string, cell: string | number) {
      const looksNum = typeof cell === 'number' || /^[\d,.\-%]+$/.test(String(cell ?? ''));
      return { 'is-num': this.isNumericHeader(header) || looksNum };
    },
  },
};
</script>

<style scoped>
.full-title {
  font-weight: 800;
  font-size: clamp(20px, 2.2vw, 28px);
  margin-bottom: 8px;
}
.table-wrap {
  overflow: auto;
  border: 1px solid var(--theme-border-subtle);
  border-radius: 6px;
}
.pro-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
}
.pro-table.dense td, .pro-table.dense th { padding: 8px 10px; }
.pro-table thead th {
  position: sticky;
  top: 0;
  background: #F3F4F6;
  color: var(--theme-text-primary);
  text-align: left;
  font-weight: 700;
  font-size: 18px;
  border-bottom: 1px solid var(--theme-border-subtle);
}
.pro-table tbody td {
  border-bottom: 1px solid var(--theme-border-subtle);
}
.pro-table tbody tr:nth-child(even) td { background: #FAFAFB; }
.is-num { text-align: right; font-variant-numeric: tabular-nums; }
.caption { margin-top: 6px; display: inline-block; font-size: 12px; }
@media print {
  .table-wrap { overflow: visible; }
  .pro-table thead th { position: static; }
}
</style>
