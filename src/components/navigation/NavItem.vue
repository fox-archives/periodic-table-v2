<template>
  <li
    class="nav-item-outer"
    :style="currentTheme.navigationTheme[navItemState]"
    @mouseenter="navItemState = 'hover'"
    @mouseleave="navItemState = 'default'"
    @mousedown="navItemState = 'click'"
    @mouseup="navItemState = 'hover'"
  >
    <slot/>
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
  padding: 5px;
  margin: 3px;
  border: 1px solid black;
  border-radius: 5px;

  &:hover {
    cursor: pointer;
  }
}
</style>
