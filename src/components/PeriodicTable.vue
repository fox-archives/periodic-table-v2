<template>
  <div>
    <div v-if="getElementsData == false">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="getElementsData">
      <div class="element-outer" v-for="elementObject in getElementsData" v-bind:key="elementObject.name">
        <slot :propElementObject="elementObject"></slot>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "PeriodicTable",
  computed: {
    ...mapGetters("elementData/", ["getElementsData"])
  },
  methods: {
    ...mapActions("elementData/", ["fetchElementsData"])
  },
  created() {
    let dataToFetch = {
      tab: this.$route.meta.tab
    };
    this.fetchElementsData(dataToFetch);
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
