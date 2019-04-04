<template>
  <div class="periodic-table-outer">
    <div v-if="!tabAtomsData">
      <p>LOADING DATA HERE</p>
    </div>
    <div
      class="grid-container-outer"
      :style="currentTheme.periodicTable[mouseState]"
      @mouseenter="mouseState = 'hover'"
      @mouseleave="mouseState = 'default'"
    >
      <div class="grid-container">
        <section class="grid" v-if="tabAtomsData">
          <div
            class="element-outer"
            v-for="(atomData, index) in tabAtomsData"
            v-bind:key="atomData.name"
          >
            <element-z :atomData="atomData" :index="index"></element-z>
          </div>
        </section>
      </div>
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

<style scoped lang="css">
.periodic-table-outer {
  overflow: hidden;
}

.grid-container-outer {
  position: relative;
  border-radius: 4px;
  margin: 0 5px 0 5px;
  max-width: 100%;
  height: 0;
  padding-bottom: 60%;
}

.grid-container {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.grid {
  display: grid;
  grid-template-columns: repeat(10, 1fr);
  height: 100%;
  width: 100%;
}

.element-outer {
  overflow: hidden;
}
</style>
