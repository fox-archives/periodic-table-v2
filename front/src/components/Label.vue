<template>
  <div
    class="label"
    :style="currentTheme.label[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    {{ label }}
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "Label",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"])
  },
  props: {
    label: Number
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
}

.label:hover {
  cursor: pointer;
}
</style>
