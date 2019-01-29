<template>
  <div class="information-outer">
    <div class="information-inner">
      <div class="information" v-for="(property, key) in selectedAtom" :key="property">
        <div v-if="dataNotBasic(key)" >
          <p>{{ atomKeyInEnglish(key) }}</p>
          <p>{{ property }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import convertKeyToEnglish from "@/components/atomKeyInEnglish";

export default {
  name: "ElementInformation",
  computed: {
    ...mapState("elementData/", ["selectedAtom"])
  },
  methods: {
    dataNotBasic: function(key) {
      if (
        key === "name" ||
        key === "abbreviation" ||
        key === "atomicNumber" ||
        key === "atomicWeight"
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
  margin: 5px;
  background-color: lightblue;
}

.information {
  margin: 5px;
  background-color: cornflowerblue;

  &:hover {
    cursor: pointer;
  }
}
</style>
