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
            class="atom-outer"
            v-for="(atomData, index) in tabAtomsData"
            v-bind:key="atomData.name"
          >
            <atom-z :atomData="atomData" :index="index"></atom-z>
          </div>
          <!-- TODO: Vue 3 Componentalize the following (cannot render multiple element on root instance) -->
          <div
            v-for="rowLabel in 7"
            :key="'row' + rowLabel"
            class="row-label"
            :style="positionRowLabel(rowLabel)"
          >
            <div class="row-label label">
              {{ rowLabel }}
            </div>
          </div>
          <div
            v-for="columnLabel in 18"
            :key="'column' + columnLabel"
            class="column-label"
            :style="positionColumnLabel(columnLabel)"
          >
            <div class="column-label label">
              {{ columnLabel }}
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";
import Atom from "@/components/Atom";

export default {
  name: "PeriodicTable",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapGetters("atomData/", ["tabAtomsData", "specificAtomsData"])
  },
  methods: {
    ...mapActions("atomData/", ["fetchUpdatePeriodicTableData"]),
    positionColumnLabel: function(columnLabel) {
      return {
        "grid-area": 1 + "/" + (columnLabel + 1) + "/" + 2 + "/" + (columnLabel + 2)
      }
    },
    positionRowLabel: function(rowLabel) {
      return {
        "grid-area": (rowLabel + 1) + "/" + 1 + "/" + (rowLabel + 2) + "/" + 2
      }
    }
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
    "atom-z": Atom
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
  grid-template-columns: 15px repeat(18, 1fr);
  grid-template-rows: 20px repeat(7, 1fr) 1.5vh repeat(2, 1fr);
  grid-gap: 2px;
  height: 100%;
  width: 100%;
  /* If atoms overflow and exceed available width, this overflow adds scrolling */
  overflow: auto;
}

.atom-outer {
  position: relative;
}

.label {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
}
</style>
