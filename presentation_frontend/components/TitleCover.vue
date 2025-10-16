<script setup lang="ts">
/**
 * TitleCover
 * Big title + subtitle + metadata footer with date and optional caption.
 * Props are strings; font sizes scale responsively.
 */
// PUBLIC_INTERFACE
const props = withDefaults(defineProps<{
  title: string
  subtitle?: string
  date?: string
  caption?: string
}>(), {
  subtitle: '',
  date: '',
  caption: '',
});
</script>

<template>
  <section class="title-cover" role="group" aria-label="Title slide">
    <header class="title-header">
      <h1 class="title">{{ title }}</h1>
      <p v-if="subtitle" class="subtitle">{{ subtitle }}</p>
    </header>

    <footer class="title-footer" aria-label="Metadata">
      <div class="meta-left">
        <span class="meta-label">Prepared:</span>
        <time v-if="date" :datetime="date" class="meta-value">{{ date }}</time>
        <span v-else class="meta-value">—</span>
      </div>
      <div v-if="caption" class="meta-right muted">{{ caption }}</div>
    </footer>
  </section>
</template>

<style scoped>
.title-cover {
  display: grid;
  grid-template-rows: 1fr auto;
  min-height: 100%;
  padding: 40px 48px;
  place-items: center;
  text-align: center;
  gap: 36px;
  background: var(--theme-bg-canvas);
  position: relative;
}
.title-header {
  display: grid;
  gap: 12px;
}
.title {
  font-weight: 800;
  letter-spacing: -0.02em;
  line-height: 1.1;
  font-size: clamp(32px, 4.2vw, 56px);
  color: var(--theme-text-primary);
}
.subtitle {
  font-size: clamp(16px, 1.6vw, 20px);
  color: var(--theme-text-secondary);
}
.title-footer {
  width: min(1080px, 100%);
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
  border-top: 1px solid var(--theme-border-subtle);
  padding-top: 12px;
}
.meta-left {
  display: inline-flex;
  gap: 8px;
  align-items: baseline;
}
.meta-label {
  font-variant-caps: small-caps;
  letter-spacing: .08em;
  color: var(--theme-text-secondary);
  font-weight: 700;
  font-size: 12px;
}
.meta-value {
  color: var(--theme-text-primary);
  font-weight: 600;
}
@media print {
  .title-cover { padding: 24px; gap: 20px; }
  .title { font-size: 40px; }
}
</style>
