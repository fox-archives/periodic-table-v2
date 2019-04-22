<template>
  <div class="information-outer" :style="[...currentTheme.atomInformation]">
    <div class="information-inner">
      <div
        class="atom-information-box-outer"
        v-for="(property, key) in selectedAtom"
        :key="key"
      >
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
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["selectedAtom"])
  },
  components: {
    "atom-information-box": AtomInformationBox
  }
};
</script>

<style scoped lang="css">
.information-outer {
  border-radius: 4px;
}
</style>

<style scoped>
.information-outer {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 2px 2px 4px var(--box-shadow);
  color: var(--color);
}

.information-outer:hover {
  box-shadow: 2px 2px 4px var(--box-shadow_hover);
}
</style>
