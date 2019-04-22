<template>
  <div
    class="label"
    :class="groupLabels[labelNumber - 1]"
    :style="[...currentTheme.label]"
  >
    {{ labelNumber }}
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "LabelGroup",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("labelData/", ["groupLabels"])
  },
  props: {
    labelNumber: Number
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
</style>
