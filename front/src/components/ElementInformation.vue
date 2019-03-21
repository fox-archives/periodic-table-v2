<template>
  <div
    class="information-outer"
    :style="currentTheme.elementInformation.information[mouseStateInformation]"
    @mouseenter="mouseStateInformation = 'hover'"
    @mouseleave="mouseStateInformation = 'default'"
  >
    <div class="information-inner">
      <div v-for="(property, key) in selectedAtom" :key="key">
        <div
          v-if="dataNotBasic(key)"
          class="box"
          :style="currentTheme.elementInformation.box[mouseStateBox]"
          @mouseenter="mouseStateBox = 'hover'"
          @mouseleave="mouseStateBox = 'default'"
          @mousedown="updateSpecificAtomsData(key)"
        >
          <p>{{ atomKeyInEnglish(key) }}</p>
          <p>{{ property }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import convertKeyToEnglish from "@/components/atomKeyToEnglish";

export default {
  name: "ElementInformation",
  data() {
    return {
      mouseStateInformation: "default",
      mouseStateBox: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("elementData/", ["selectedAtom"])
  },
  methods: {
    ...mapMutations("elementData/", ["updateSpecificAtomsData"]),
    dataNotBasic: function(key) {
      if (
        key === "name" ||
        key === "abbreviation" ||
        key === "atomicNumber" ||
        key === "atomicMass"
      ) {
        return false;
      }
      return true;
    },
    atomKeyInEnglish: function(key) {
      return convertKeyToEnglish(key);
    }
  }
};
</script>

<style scoped lang="scss">
.information-outer {
  margin: 0 0 0 5px;
  border-radius: 4px;
}

.box {
  margin: 5px;

  &:hover {
    cursor: pointer;
  }
}
</style>
