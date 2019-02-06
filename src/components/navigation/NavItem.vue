<template>
  <li class="nav-item-outer">
    <slot/>
  </li>
</template>

<script>
export default {
  name: "NavItem"
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
    background-color: aquamarine;
  }
}
</style>
