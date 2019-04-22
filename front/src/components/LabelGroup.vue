<template>
  <div
    class="label"
    :class="groupLabels[labelNumber - 1]"
    :style="currentTheme.label[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    {{ labelNumber }}
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "LabelGroup",
  data: function() {
    return {
      mouseState: "default"
    };
  },
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
