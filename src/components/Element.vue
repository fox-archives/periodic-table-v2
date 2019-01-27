<template>
  <div class="element-inner" @click="updateSelectedElement(basicElementData.atomicNumber)">
    <h3>{{ basicElementData.name }}</h3>
    <p>{{ basicElementData.atomicNumber }}</p>
    <p>{{ tabElementSpecificData }}</p>
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
    basicElementData: Object,
    tabElementSpecificData: Number
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
