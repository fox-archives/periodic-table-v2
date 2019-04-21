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
      <section class="grid" v-if="tabAtomsData" ref="periodicTableGrid">
        <div
          class="atom-outer"
          v-for="(atomData, index) in tabAtomsData"
          v-bind:key="atomData.name"
          :style="positionAtom(index)"
        >
          <atom-z
            :atomData="atomData"
            :atomIndex="index"
            :atomPlacement="atomPlacementData(index)"
          ></atom-z>
        </div>
        <div
          v-for="periodLabelIndex in periodLabels.length"
          :key="'row' + periodLabelIndex"
          class="label-outer"
          :style="positionRowLabel(periodLabelIndex)"
        >
          <label-z :labelNumber="periodLabelIndex" labelType="period" />
        </div>
        <div
          v-for="groupLabel in groupLabels.length"
          :key="'column' + groupLabel"
          class="label-outer"
          :style="positionColumnLabel(groupLabel)"
        >
          <label-z :labelNumber="groupLabel" labelType="group" />
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import Atom from "@/components/Atom";
import Label from "@/components/Label";
import atomPlacements from "../../../wolf/generic-atom-data/placement.json";

export default {
  name: "PeriodicTable",
  data: function() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["tabAtomsData"]),
    ...mapState("labelData/", ["periodLabels", "groupLabels"])
  },
  methods: {
    ...mapActions("atomData/", ["fetchUpdatePeriodicTableData"]),
    atomPlacementData: function(index) {
      return atomPlacements[index];
    },
    positionAtom: function(index) {
      let row = this.atomPlacementData(index).row + 1;
      let column = this.atomPlacementData(index).column + 1;

      return {
        "grid-area": `${row} / ${column} / ${row + 1} / ${column}`
      };
    },
    positionColumnLabel: function(columnLabel) {
      return {
        "grid-area": `${1} / ${columnLabel + 1} / ${2} / ${columnLabel + 2}`
      };
    },
    positionRowLabel: function(rowLabel) {
      return {
        "grid-area": `${rowLabel + 1} / ${1} / ${rowLabel + 2} / ${2}`
      };
    },
    adjustFontSize: function(periodicTableDOMRect) {
      let tableWidth = periodicTableDOMRect.width;
      // Setting variables on `html` element, since manually changing inline styles is too much
      document.documentElement.style.setProperty(
        "--atom-atomic-number-font-size",
        `${tableWidth * 0.012}px`
      );
      document.documentElement.style.setProperty(
        "--atom-abbreviation-font-size",
        `${tableWidth * 0.022}px`
      );
      document.documentElement.style.setProperty(
        "--atom-name-font-size",
        `${tableWidth * 0.012}px`
      );
      document.documentElement.style.setProperty(
        "--atom-dynamic-font-size",
        `${tableWidth * 0.022}px`
      );
    }
  },
  watch: {
    $route: function() {
      let dataToFetch = {
        tab: this.$route.meta.tab
      };
      this.fetchUpdatePeriodicTableData(dataToFetch);
    }
  },
  created: function() {
    let dataToFetch = {
      tab: this.$route.meta.tab
    };
    this.fetchUpdatePeriodicTableData(dataToFetch);
    // TODO: Debounce etc. this guy
    this.$nextTick(() => {
      // Recall this may set value of zero just after setting the size (although we probably don't need to worry about that here)
      let periodicTableDOMRect = this.$refs.periodicTableGrid.getBoundingClientRect();
      this.adjustFontSize(periodicTableDOMRect);

      window.addEventListener("resize", () => {
        let periodicTableDOMRect = this.$refs.periodicTableGrid.getBoundingClientRect();
        this.adjustFontSize(periodicTableDOMRect);
      });
    });
  },
  components: {
    "atom-z": Atom,
    "label-z": Label
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

/* Actual grid */
.grid {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: grid;
  grid-template-columns: 15px repeat(18, 1fr);
  grid-template-rows: 20px repeat(7, 1fr) 1.5vh repeat(2, 1fr);
  grid-gap: 2px;
  /* If atoms overflow and exceed available width, this overflow adds scrolling */
  /*overflow: auto;*/
}

.atom-outer {
  position: relative;
  overflow: visible; /* So shadows appear */
}
</style>
