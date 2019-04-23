<template>
  <div
    class="label"
    :class="[...groupLabelsActive[labelIndex]]"
    :style="[...currentTheme.label]"
    @mouseover="[updateActiveAtoms(labelIndex)]"
  >
    {{ labelIndex + 1 }}
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "LabelGroup",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("labelData/", ["groupLabelsActive"])
  },
  methods: {
    ...mapMutations("atomData/", ["updateActiveAtoms"]),
  },
  props: {
    labelIndex: Number
  }
};
</script>

<style scoped>
.label {
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  border-radius: 2px;
}

.label:hover {
  cursor: pointer;
}
</style>

<style scoped>
.label {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 1px 1px 2px var(--box-shadow);
  color: var(--color);
}

.label:hover {
  box-shadow: 1px 1px 2px var(--box-shadow_hover);
}

.label.active {
  background-color: var(--background-color_c-active);
}
</style>
