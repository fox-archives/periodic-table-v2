<template>
  <div class="element-inner">
    <h3>{{ basicElementData.name }}</h3>
    <p>{{ basicElementData.atomicNumber }}</p>
  </div>
</template>

<script>
export default {
  name: "Element",
  props: {
    basicElementData: Object,
    tabElementSpecificData: Array
  }
};
</script>

<style scoped lang="scss">
.element-inner {
  height: 100%;
  width: 100%;
  background-color: lightsalmon;

  &:hover {
    cursor: pointer;
  }
}
</style>
