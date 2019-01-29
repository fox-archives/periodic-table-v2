<template>
  <div class="element-inner" @click="updateSelectedAtom(atomData[ATOMIC_NUMBER])">
    <h3>{{ atomData[NAME] }}</h3>
    <p>{{ atomData[ATOMIC_NUMBER] }}</p>
    <p>{{ specificAtomsData[index] }}</p>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "Element",
  computed: {
    ...mapState("variables/", ["ATOMIC_NUMBER", "NAME"]),
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
.element-inner {
  height: 100%;
  width: 100%;
  background-color: lightsalmon;

  &:hover {
    cursor: pointer;
  }
}
</style>
