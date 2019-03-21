<template>
  <div class="periodic-table-outer">
    <div v-if="!tabAtomsData">
      <p>LOADING DATA HERE</p>
    </div>
    <div
      class="grid-outer"
      :style="currentTheme.periodicTable[mouseState]"
      @mouseenter="mouseState = 'hover'"
      @mouseleave="mouseState = 'default'"
    >
      <!-- <div class="grid-container">
        <section class="grid" v-if="tabAtomsData">
          <div
            class="element-outer"
            v-for="(atomData, index) in tabAtomsData"
            v-bind:key="atomData.name"
          >
            <element-z :atomData="atomData" :index="index"></element-z>
          </div>
        </section>
      </div> -->
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";
import Element from "@/components/Element";

export default {
  name: "PeriodicTable",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
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
.periodic-table-outer {
  overflow: auto;
}

.grid-outer {
  border-radius: 4px;
  margin: 0 5px 0 5px;
  max-width: 100%;
  height: 0;
  padding-bottom: 60%;
  background-color: forestgreen;
}

/* .grid-container {
}

.grid {
  background-color: lime;
  display: grid;

  grid-template-columns: repeat(18, 1fr);
  grid-template-rows: repeat(8, 1fr);
}

.element-outer {
  background-color: purple;
  margin: 3px;
  overflow: visible;
} */
</style>
