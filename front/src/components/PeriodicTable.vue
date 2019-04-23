<template>
  <div>
    <div v-if="!tabAtomsData">
      <p>LOADING DATA HERE</p>
    </div>
    <div class="grid-wrapper-outer" :style="[...currentTheme.periodicTable]">
      <section class="grid" v-if="tabAtomsData" ref="periodicTableGrid">
        <div
          class="atom-outer"
          v-for="(atomData, atomIndex) in tabAtomsData"
          :key="atomData.name"
          :style="positionAtom(atomIndex)"
        >
          <atom-z
            :atomData="atomData"
            :atomIndex="atomIndex"
            :atomPlacement="atomPlacementData(atomIndex)"
          ></atom-z>
        </div>
        <div
          v-for="(labelNumber, labelIndex) in periodLabelsActive.length"
          :key="'period' + labelNumber"
          class="label-outer"
          :style="positionRowLabel(labelIndex)"
        >
          <label-period :labelIndex="labelIndex" />
        </div>
        <div
          v-for="(labelNumber, labelIndex) in groupLabelsActive.length"
          :key="'group' + labelNumber"
          class="label-outer"
          :style="positionColumnLabel(labelIndex)"
        >
          <label-group :labelIndex="labelIndex" />
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import Atom from "@/components/Atom";
import LabelPeriod from "@/components/LabelPeriod";
import LabelGroup from "@/components/LabelGroup";
import atomPlacements from "../../../wolf/generic-atom-data/placement.json";

export default {
  name: "PeriodicTable",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["tabAtomsData"]),
    ...mapState("labelData/", ["periodLabelsActive", "groupLabelsActive"])
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
    positionColumnLabel: function(columnLabelIndex) {
      return {
        "grid-area": `${1} / ${columnLabelIndex + 2} / ${2} / ${columnLabelIndex +
          3}`
      };
    },
    positionRowLabel: function(rowLabelIndex) {
      return {
        "grid-area": `${rowLabelIndex + 2} / ${1} / ${rowLabelIndex + 3} / ${2}`
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
    "label-period": LabelPeriod,
    "label-group": LabelGroup
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

<style scoped>
.grid-wrapper-outer {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 1px 1px 2px var(--box-shadow);
}

.grid-wrapper-outer:hover {
  box-shadow: 2px 2px 4px var(--box-shadow_hover);
}
</style>
