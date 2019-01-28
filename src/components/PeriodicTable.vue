<template>
  <div>
    <div v-if="tabAtomsData == false">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="tabAtomsData">
      <div class="element-outer" v-for="atomData in tabAtomsData" v-bind:key="atomData.name">
        <element-z :atomData="atomData"></element-z>
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
    ...mapGetters("elementData/", ["tabAtomsData", "specificAtomsData"])
  },
  methods: {
    ...mapActions("elementData/", ["fetchUpdatePeriodicTableData"])
  },
  watch: {
    $route() {
      let dataToFetch = {
        tab: this.$route.meta.tab
      };
      this.fetchUpdatePeriodicTableData(dataToFetch);
    }
  },
  created() {
    let dataToFetch = {
      tab: this.$route.meta.tab
    };
    this.fetchUpdatePeriodicTableData(dataToFetch);
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
