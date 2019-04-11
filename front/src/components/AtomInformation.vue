<template>
  <div
    class="information-outer"
    :style="currentTheme.atomInformation.information[mouseStateInformation]"
    @mouseenter="mouseStateInformation = 'hover'"
    @mouseleave="mouseStateInformation = 'default'"
  >
    <div class="information-inner">
      <div v-for="(property, key) in selectedAtom" :key="key">
        <atom-information-box
          :myProperty="property"
          :myKey="key"
        ></atom-information-box>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import AtomInformationBox from "@/components/AtomInformationBox";

export default {
  name: "AtomInformation",
  data() {
    return {
      mouseStateInformation: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["selectedAtom"])
  },
  components: {
    "atom-information-box": AtomInformationBox
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
