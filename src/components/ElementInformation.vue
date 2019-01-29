<template>
  <div class="information-outer">
    <div class="information-inner">
      <div class="information" v-for="(property, key, index) in selectedAtom" :key="property">
        <div v-if="dataNotBasic(key)" >
          <p>{{ nameFromSelectedAtomKey[index] }}</p>
          <p>{{ property }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ElementInformation",
  computed: {
    ...mapGetters("elementData/", ["selectedAtom", "tabAtomsData"]),
    nameFromSelectedAtomKey: function() {
      // Assumes order of properties
      // TODO: Make actual keys have spaces and look like what's going to show up (so we don't have a giant switch statement)
      let selectedAtomKeys = Object.keys(this.selectedAtom);
      for (let i = 0; i < selectedAtomKeys.length; i++) {
        switch (selectedAtomKeys[i]) {
          case "name":
            selectedAtomKeys[i] = "Name";
            break;
          case "abbreviation":
            selectedAtomKeys[i] = "Abbreviation";
            break;
          case "atomicNumber":
            selectedAtomKeys[i] = "Atomic Number";
            break;
          case "atomicWeight":
            selectedAtomKeys[i] = "Atomic Weight";
            break;
          case "boilingPoint":
            selectedAtomKeys[i] = "Boiling Point";
            break;
          case "meltingPoint":
            selectedAtomKeys[i] = "Melting Point";
            break;
          case "radius":
            selectedAtomKeys[i] = "Radius";
            break;
          case "electronegativity":
            selectedAtomKeys[i] = "Electronegativity";
            break;
        }
      }
      return selectedAtomKeys;
    }
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
