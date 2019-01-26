<template>
  <div class="element-inner">
    <h3>{{ elementData.name }}</h3>
    <p>{{ elementData.atomicNumber }}</p>
  </div>
</template>

<script>
export default {
  name: "TableElement",
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
  border-radius: 10px;

  &:hover {
    cursor: pointer;
  }
}
</style>
