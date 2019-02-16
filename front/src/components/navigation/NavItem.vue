<template>
  <li
    class="nav-item-outer"
    :style="currentTheme.navigation[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
    @mousedown="mouseState = 'click'"
    @mouseup="mouseState = 'hover'"
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
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"])
  }
};
</script>

<style scoped lang="scss">
.nav-item-outer {
  padding: 7px 9px;
  margin: 3px 3px;
  border-radius: 4px;
  font-size: 1.33rem;

  &:hover {
    cursor: pointer;
  }
}
</style>
