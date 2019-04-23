<template>
  <div
    class="label"
    :class="groupLabels[labelNumber - 1]"
    @mouseover="updateActiveAtoms(labelNumber)"
  >
    {{ labelNumber }}
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "Label",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("labelData/", ["periodLabels", "groupLabels"])
  },
  props: {
    labelNumber: Number,
    labelType: {
      type: String,
      validator: function(value) {
        return value === "period" || value === "group";
      }
    }
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

.label.active {
  background-color: blue;
}
</style>
