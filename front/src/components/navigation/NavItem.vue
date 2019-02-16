<template>
  <li
    class="nav-item-outer"
    :style="currentTheme.navigationTheme[navItemState]"
    @mouseenter="navItemState = 'hover'"
    @mouseleave="navItemState = 'default'"
    @mousedown="navItemState = 'click'"
    @mouseup="navItemState = 'hover'"
  >
    <slot />
  </li>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "NavItem",
  data() {
    return {
      navItemState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"])
  }
};
</script>

<style scoped lang="scss">
.nav-item-outer {
  padding: 4px 8px;
  margin: 3px 4px;
  border-radius: 5px;
  font-size: 1.33rem;

  &:hover {
    cursor: pointer;
  }
}
</style>
