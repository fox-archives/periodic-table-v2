<template>
  <div
    v-if="dataNotBasic(myKey)"
    class="atom-information-box-inner"
    :style="[...currentTheme.atomInformationBox]"
  >
    <div class="box-text">
      <p>{{ atomKeyInEnglish(myKey) }}</p>
      <p>{{ myProperty }}</p>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import convertKeyToEnglish from "@/components/atomKeyToEnglish";

export default {
  name: "AtomInformationBox",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["selectedAtom"])
  },
  methods: {
    ...mapMutations("atomData/", ["updateSpecificAtomsData"]),
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

<style lang="css">
.atom-information-box-inner {
  margin-bottom: 2px;
  border-radius: 4px;
  overflow: hidden; /* not required because border-radius is really small */
}

.atom-information-box-inner:hover {
  cursor: pointer;
}

.box-text {
  margin: 2px;
}
</style>

<style scoped>
.atom-information-box-inner {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 2px 2px 4px var(--box-shadow);
  color: var(--color);
}

.atom-information-box-inner:hover {
  box-shadow: 2px 2px 4px var(--box-shadow_hover);
}
</style>
