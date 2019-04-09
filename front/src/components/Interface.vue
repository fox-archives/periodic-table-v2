<template>
  <div class="interface">
    <div class="element-information-wrapper">
      <div class="element-information-wrapper-inner">
        <element-graphic class="element-graphic" />
        <element-information class="element-information" />
      </div>
    </div>
    <div class="periodic-table-wrapper">
      <div class="periodic-table-wrapper-inner">
        <periodic-table />
      </div>
    </div>
  </div>
</template>

<script>
import ElementGraphic from "@/components/ElementGraphic";
import ElementInformation from "@/components/ElementInformation";
import PeriodicTable from "@/components/PeriodicTable";

export default {
  name: "Interface",
  components: {
    "element-graphic": ElementGraphic,
    "element-information": ElementInformation,
    "periodic-table": PeriodicTable
  }
};
</script>

<style scoped>
.interface {
  display: grid;
  grid-column-gap: 10px;
  grid-template-columns: max-content 1fr;
  height: 100%;
}

.element-information-wrapper {
  position: relative;
  width: 17vw;
}

.element-information-wrapper-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: grid;
  grid-template-rows: max-content 1fr;
  grid-row-gap: 10px;
}

.element-information {
  overflow: auto;
}

.periodic-table-wrapper {
  position: relative;
}
.periodic-table-wrapper-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: auto;
}
</style>
