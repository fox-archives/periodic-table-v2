<template>
  <div
    class="atom-inner"
    @mouseover="updateSelectedAtom(atomData.atomicNumber)"
    :style="currentTheme.atom[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    <p class="atomic-number" :style="fontSize.atomicNumber">
      {{ atomData.atomicNumber }}
    </p>
    <p class="abbreviation" :style="fontSize.abbreviation">
      <b>{{ atomData.abbreviation }}</b>
    </p>
    <h3 class="name" :style="fontSize.name">{{ atomData.name }}</h3>
    <p class="dynamic" :style="fontSize.dynamic">
      {{ specificAtomsData[index] }}
    </p>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "Atom",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["specificAtomsData"]),
    // CHECK THAT THIS WORKS
    fontSize: function() {
      return {
        atomicNumber: { fontSize: "1rem" },
        abbreviation: { fontSize: "1.3rem" },
        name: { fontSize: "0.8rem" },
        dynamic: { fontSize: "1rem" }
      };
    }
  },
  methods: {
    ...mapMutations("atomData/", ["updateSelectedAtom"])
  },
  props: {
    atomData: Object,
    index: Number
  }
};
</script>

<style scoped lang="scss">
.atom-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;

  &:hover {
    cursor: pointer;
  }
}
</style>
