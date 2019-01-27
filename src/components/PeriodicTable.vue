<template>
  <div>
    <div v-if="basicElements == false">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="basicElements">
      <div class="element-outer" v-for="(basicElement, index) in basicElements" v-bind:key="basicElement.name">
        <element-z :basicElementData="basicElement" :tabElementSpecificData="tabElementsSpecific[index]"></element-z>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import Element from "@/components/Element";

export default {
  name: "PeriodicTable",
  computed: {
    ...mapGetters("elementData/", ["basicElements", "tabElementsSpecific"])
  },
  methods: {
    ...mapActions("elementData/", ["fetchPeriodicTableData"])
  },
  watch: {
    $route() {
      let dataToFetch = {
        tab: this.$route.meta.tab
      };
      this.fetchPeriodicTableData(dataToFetch);
    }
  },
  created() {
    let dataToFetch = {
      tab: this.$route.meta.tab
    };
    this.fetchPeriodicTableData(dataToFetch);
  },
  components: {
    "element-z": Element
  }
};
</script>

<style scoped lang="scss">
.periodic-table {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr;
}

.element-outer {
  margin: 5px;
}
</style>
