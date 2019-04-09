<template>
  <div
    class="element-inner"
    @mouseover="updateSelectedAtom(atomData.atomicNumber)"
    :style="currentTheme.element[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    <h3>{{ atomData.name }}</h3>
    <p>{{ atomData.atomicNumber }}</p>
    <p>{{ specificAtomsData[index] }}</p>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "Element",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("elementData/", ["specificAtomsData"])
  },
  methods: {
    ...mapMutations("elementData/", ["updateSelectedAtom"])
  },
  props: {
    atomData: Object,
    index: Number
  }
};
</script>

<style scoped lang="scss">
h3,
p {
  overflow: hidden;
}
.element-inner {
  overflow: visible;
  height: 100%;

  &:hover {
    cursor: pointer;
  }
}
</style>
