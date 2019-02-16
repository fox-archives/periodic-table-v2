<template>
  <div>
    <div v-if="!tabAtomsData">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="tabAtomsData">
      <div
        class="element-outer"
        v-for="(atomData, index) in tabAtomsData"
        v-bind:key="atomData.name"
      >
        <element-z :atomData="atomData" :index="index"></element-z>
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

<style scoped>
.periodic-table {
  display: grid;
  grid-template-columns: repeat(18, 1fr);
  max-width: 100%;
}

.element-outer {
  margin: 5px;
  padding: 1px;
  overflow: hidden;
}
</style>
