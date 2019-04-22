<template>
  <div
    class="atom-inner"
    @mouseover="
      [updateSelectedAtom(atomData.atomicNumber), updateActiveLabel(atomIndex)]
    "
    :style="currentTheme.atom[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    <p class="atomic-number">
      {{ atomData.atomicNumber }}
    </p>
    <p class="abbreviation">
      <b>{{ atomData.abbreviation }}</b>
    </p>
    <h3 class="name">{{ atomData.name }}</h3>
    <p class="dynamic-value">
      {{ specificAtomsData[atomIndex] }}
    </p>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "Atom",
  data: function() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["specificAtomsData"])
  },
  methods: {
    ...mapMutations("atomData/", ["updateSelectedAtom"]),
    ...mapMutations("labelData/", ["updateActiveLabel"])
  },
  created: function() {
    // Looking for resize font size via debounce on window width update? Code in PeriodicTable.vue
  },
  props: {
    atomData: Object,
    atomIndex: Number,
    atomPlacement: Object
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
  border-radius: 2px;
  text-overflow: clip;
  /* So text with dashes doesn't wrap around and have extra height */
  white-space: nowrap;
}

.atom-inner:hover {
  cursor: pointer;
}

.atomic-number {
  font-size: var(--atom-atomic-number-font-size);
}

.abbreviation {
  font-size: var(--atom-abbreviation-font-size);
}

.name {
  font-size: var(--atom-name-font-size);
}

.dynamic-value {
  font-size: var(--atom-dynamic-font-size);
}
</style>
