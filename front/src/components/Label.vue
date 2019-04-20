<template>
  <div
    class="label"
    :class="{ active: checkLabelActive }"
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
  name: "Label",
  data: function() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["selectedAtomPosition"]),
    checkLabelActive: function() {
      return this.selectedAtomPosition[this.labelType] === this.labelNumber;
    }
  },
  props: {
    labelNumber: Number,
    labelType: String
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

.active {
  position: relative;
  top: 5px;
}
</style>
