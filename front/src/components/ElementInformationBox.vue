<template>
  <div
    v-if="dataNotBasic(myKey)"
    class="box"
    :style="currentTheme.elementInformation.box[mouseStateBox]"
    @mouseenter="mouseStateBox = 'hover'"
    @mouseleave="mouseStateBox = 'default'"
    @mousedown="updateSpecificAtomsData(myKey)"
  >
    <p>{{ atomKeyInEnglish(myKey) }}</p>
    <p>{{ myProperty }}</p>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import convertKeyToEnglish from "@/components/atomKeyToEnglish";

export default {
  name: "ElementInformationBox",
  data() {
    return {
      mouseStateBox: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("elementData", ["selectedAtom"])
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
  },
  props: {
    myKey: String,
    myProperty: [String, Number, Array]
  }
};
</script>
