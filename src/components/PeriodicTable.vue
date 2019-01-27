<template>
  <div>
    <div v-if="getBasicElementsData == false">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="getBasicElementsData">
      <div class="element-outer" v-for="elementObject in getBasicElementsData" v-bind:key="elementObject.name">
        <slot :elementObject="elementObject"></slot>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "PeriodicTable",
  computed: {
    ...mapGetters("elementData/", ["getBasicElementsData"])
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
