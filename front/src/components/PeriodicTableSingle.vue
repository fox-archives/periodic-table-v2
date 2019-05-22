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
          <div
            class="atom-inner"
            :class="[...activeAtoms[atomIndex]]"
            @mouseover="[updateSelectedAtom(atomData.atomicNumber), updateActiveLabels(atomIndex)]"
            @mouseleave="updateActiveLabels(-1)"
            :style="[...currentTheme.atom]"
          >
            <p style="font-size: 6px;">{{ atomData.fusionHeat || "test" }}</p>
            <p class="atomic-number">{{ atomData.atomicNumber }}</p>
            <p class="abbreviation">
              <b>{{ atomData.abbreviation }}</b>
            </p>
            <h3 class="name">{{ atomData.name }}</h3>
            <p class="dynamic-value">{{ specificAtomsData[atomIndex] }}</p>
          </div>
        </div>
        <div
          v-for="(labelNumber, labelIndex) in periodLabelsActive.length"
          :key="'period' + labelNumber"
          class="label-outer"
          :style="positionRowLabel(labelIndex)"
        >
          <label-period :labelIndex="labelIndex"/>
        </div>
        <div
          v-for="(labelNumber, labelIndex) in groupLabelsActive.length"
          :key="'group' + labelNumber"
          class="label-outer"
          :style="positionColumnLabel(labelIndex)"
        >
          <label-group :labelIndex="labelIndex"/>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import { throttle, debounce } from "lodash";
import { mapState, mapMutations, mapActions } from "vuex";
import Atom from "@/components/Atom";
import LabelPeriod from "@/components/LabelPeriod";
import LabelGroup from "@/components/LabelGroup";
import atomPlacements from "../../../wolf/generic-atom-data/placement.json";

export default {
  name: "PeriodicTable",
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("atomData/", ["tabAtomsData", "specificAtomsData", "activeAtoms"]),
    ...mapState("labelData/", ["periodLabelsActive", "groupLabelsActive"])
  },
  methods: {
    ...mapMutations("atomData/", ["updateSelectedAtom"]),
    ...mapMutations("labelData/", ["updateActiveLabels"]),
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
    this.$nextTick(() => {
      // Recall this may set value of zero just after setting the size (although we probably don't need to worry about that here)
      let periodicTableDOMRect = this.$refs.periodicTableGrid.getBoundingClientRect();
      this.adjustFontSize(periodicTableDOMRect);

      window.addEventListener(
        "resize",
        debounce(() => {
          let periodicTableDOMRect = this.$refs.periodicTableGrid.getBoundingClientRect();
          this.adjustFontSize(periodicTableDOMRect);
        }, 333)
      );

      window.addEventListener(
        "resize",
        throttle(() => {
          let periodicTableDOMRect = this.$refs.periodicTableGrid.getBoundingClientRect();
          this.adjustFontSize(periodicTableDOMRect);
        }, 1000)
      );
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

.atom-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  border-radius: 2px;
  text-overflow: clip;
  /* So text with dashes doesn't wrap around and have extra height */
  white-space: nowrap;
}

.atom-inner:hover {
  cursor: pointer;
}

.atomic-number {
  font-size: var(--atom-atomic-number-font-size);
}

.abbreviation {
  font-size: var(--atom-abbreviation-font-size);
}

.name {
  font-size: var(--atom-name-font-size);
}

.dynamic-value {
  font-size: var(--atom-dynamic-font-size);
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

.atom-inner {
  background-color: var(--background-color);
  border: 1px solid var(--border);
  box-shadow: 1px 1px 2px var(--box-shadow);
  color: var(--color);
}

.atom-inner:hover {
  box-shadow: 1px 1px 2px var(--box-shadow_hover);
}

.atom-inner.active {
  background-color: var(--background-color_c-active);
}
</style>
