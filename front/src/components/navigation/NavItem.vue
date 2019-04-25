<template>
  <li class="nav-item-outer" :style="[...currentTheme.navigationItem]">
    <slot />
  </li>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "NavItem",
  computed: {
    ...mapState("themes/", ["currentTheme"])
  }
};
</script>

<style scoped lang="scss">
.nav-item-outer {
  padding: 7px 9px;
  margin: 3px 6px 3px 0;
  border-radius: 4px;
  font-size: 1.33rem;

  &:hover {
    cursor: pointer;
  }
}
</style>

<style scoped>
.nav-item-outer {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 1px 1px 2px var(--box-shadow);
  color: var(--color);
}

.nav-item-outer:hover {
  background-color: var(--background-color_hover);
  box-shadow: 1px 1px 2px var(--box-shadow_hover);
}

.nav-item-outer:active {
  box-shadow: 2px 2px 4px var(--box-shadow_active);
}
</style>
