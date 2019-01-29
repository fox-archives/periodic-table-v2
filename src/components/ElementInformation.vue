<template>
  <div class="information-outer">
    <div class="information-inner">
      <div class="information" v-for="(property, key) in selectedAtom" :key="property">
        <div v-if="dataNotBasic(key)" >
          <p>{{ key }}</p>
          <p>{{ property }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "ElementInformation",
  computed: {
    ...mapState("variables/", [
      "NAME",
      "ABBREVIATION",
      "ATOMIC_NUMBER",
      "ATOMIC_WEIGHT"
    ]),
    ...mapState("elementData/", ["selectedAtom"])
  },
  methods: {
    dataNotBasic: function(key) {
      let atom = this; // Increase code readability
      if (
        key === atom.NAME ||
        key === atom.ABBREVIATION ||
        key === atom.ATOMIC_NUMBER ||
        key === atom.ATOMIC_WEIGHT
      ) {
        return false;
      }
      return true;
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
