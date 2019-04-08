<template>
  <div
    class="information-outer"
    :style="currentTheme.elementInformation.information[mouseStateInformation]"
    @mouseenter="mouseStateInformation = 'hover'"
    @mouseleave="mouseStateInformation = 'default'"
  >
    <div class="information-inner">
      <div v-for="(property, key) in selectedAtom" :key="key">
        <element-information-box
          :myProperty="property"
          :myKey="key"
        ></element-information-box>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import ElementInformationBox from "@/components/ElementInformationBox";

export default {
  name: "ElementInformation",
  data() {
    return {
      mouseStateInformation: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("elementData/", ["selectedAtom"])
  },
  components: {
    "element-information-box": ElementInformationBox
  }
};
</script>

<style scoped lang="scss">
.information-outer {
  border-radius: 4px;
}

.box {
  margin: 5px;

  &:hover {
    cursor: pointer;
  }
}
</style>
