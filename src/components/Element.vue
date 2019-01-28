<template>
  <div class="element-inner" @click="updateSelectedElement(atomData.atomicNumber)">
    <h3>{{ atomData.name }}</h3>
    <p>{{ atomData.atomicNumber }}</p>
  </div>
</template>

<script>
import { mapMutations } from "vuex";

export default {
  name: "Element",
  methods: {
    ...mapMutations("elementData/", ["updateSelectedElement"])
  },
  props: {
    atomData: Object
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
