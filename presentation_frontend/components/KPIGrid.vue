<script setup lang="ts">
// PUBLIC_INTERFACE
const props = withDefaults(defineProps<{
  title?: string
  kpis?: Array<{ label: string; value: string; delta?: string; note?: string }>
  columns?: 2 | 3
  caption?: string
}>(), {
  title: '',
  kpis: () => [],
  columns: 3,
  caption: '',
});
</script>

<template>
  <section class="kpi-grid" role="group" :aria-label="title || 'KPIs'">
    <header v-if="title" class="kpi-title">{{ title }}</header>
    <div class="grid" :class="[`cols-${columns || 3}`]">
      <article v-for="(k, i) in kpis" :key="i" class="kpi-card" role="figure">
        <div class="kpi-value" aria-label="KPI value">{{ k.value }}</div>
        <div class="kpi-label">{{ k.label }}</div>
        <div v-if="k.delta" class="kpi-delta" :class="deltaClass(k.delta)">{{ k.delta }}</div>
        <small v-if="k.note" class="kpi-note muted">{{ k.note }}</small>
      </article>
    </div>
    <small v-if="caption" class="caption muted">{{ caption }}</small>
  </section>
</template>

<script lang="ts">
export default {
  methods: {
    deltaClass(delta: string) {
      const neg = /^-/.test(delta.trim());
      return neg ? 'down' : 'up';
    },
  },
};
</script>

<style scoped>
.kpi-title {
  font-weight: 800;
  font-size: clamp(20px, 2.2vw, 28px);
  margin-bottom: 8px;
}
.grid {
  display: grid;
  gap: 14px;
}
.grid.cols-3 { grid-template-columns: repeat(3, minmax(0,1fr)); }
.grid.cols-2 { grid-template-columns: repeat(2, minmax(0,1fr)); }
@media (max-width: 900px) {
  .grid.cols-3 { grid-template-columns: repeat(2, minmax(0,1fr)); }
}
@media (max-width: 640px) {
  .grid.cols-3, .grid.cols-2 { grid-template-columns: 1fr; }
}
.kpi-card {
  background: var(--theme-bg-elevated);
  border: 1px solid var(--theme-border-subtle);
  border-radius: 12px;
  padding: 14px 16px;
  text-align: center;
  box-shadow: 0 8px 20px rgba(0,0,0,0.18);
}
.kpi-value {
  font-size: clamp(28px, 4vw, 44px);
  font-weight: 800;
  letter-spacing: -0.02em;
  font-variant-numeric: tabular-nums;
  background: var(--grad-primary);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
}
.kpi-label {
  margin-top: 6px;
  text-transform: uppercase;
  letter-spacing: .08em;
  color: var(--theme-text-secondary);
  font-weight: 700;
  font-size: 12px;
}
.kpi-delta { margin-top: 4px; font-weight: 700; font-size: 12px; }
.kpi-delta.up { color: #15803d; }
.kpi-delta.down { color: #b91c1c; }
.kpi-note { margin-top: 2px; display: block; }
.caption { margin-top: 6px; display: inline-block; font-size: 12px; }
</style>
