<template>
  <div class="data-outer">
    <div class="data-inner">
      <p>Data that loops over certain value in state</p>
      <p>{{ selectedElementPropertiesInElementsTab }}</p>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ElementInformation",
  computed: {
    ...mapGetters("elementData/", ["selectedElement", "elementsTab"]),
    selectedElementPropertiesInElementsTab: function() {
      console.log(this.selectedElement);
      console.log(this.elementsTab);

      let a = this.selectedElement;
      return a;
    }
  },
  methods: {
    // Only want keys in selectedElements that are in elementsTab
  }
};
</script>

<style scoped>
.data-outer {
  margin: 5px;
  background-color: lightblue;
  height: 100%;
}
</style>
