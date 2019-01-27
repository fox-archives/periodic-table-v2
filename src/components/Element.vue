<template>
  <div class="element-inner">
    <h3>{{ elementData.name }}</h3>
    <p>{{ elementData.atomicNumber }}</p>
  </div>
</template>

<script>
export default {
  name: "Element",
  props: {
    elementData: Object
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
