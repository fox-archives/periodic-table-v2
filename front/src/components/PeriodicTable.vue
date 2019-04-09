<template>
  <div>
    <div v-if="!tabAtomsData">
      <p>LOADING DATA HERE</p>
    </div>
    <div
      class="grid-wrapper-outer"
      :style="currentTheme.periodicTable[mouseState]"
      @mouseenter="mouseState = 'hover'"
      @mouseleave="mouseState = 'default'"
    >
      <div class="grid-wrapper">
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
/* For aspect ratio */
.grid-wrapper-outer {
  position: relative;
  border-radius: 4px;
  max-width: 100%;
  height: 0;
  padding-bottom: 60%;
}

/* For aspect ratio */
.grid-wrapper {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

/* Actual grid */
.grid {
  display: grid;
  grid-template-columns: repeat(18, 1fr);
  grid-template-rows: repeat(7, 1fr) 1.5vh repeat(2, 1fr);
  grid-gap: 2px;
  height: 100%;
  width: 100%;
  /* If atoms overflow and exceed available width, this overflow adds scrolling */
  overflow: auto;
}

.element-outer {
  position: relative;
}
</style>
