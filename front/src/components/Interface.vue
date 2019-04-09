<template>
  <div class="interface">
    <div class="element-information-wrapper">
      <div class="element-information-wrapper-inner">
        <element-graphic class="element-graphic" />
        <element-information class="element-information" />
      </div>
    </div>
    <periodic-table class="periodic-table" />
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
  grid-template-columns: 17vw 1fr;
  grid-column-gap: 10px;
  /*grid-template-columns: max-content 1fr;*/
  height: 100%;
  /*width: 100%;*/
}

.element-information-wrapper {
  position: relative;
  /*height: 100%;*/
  /*width: 100%;*/
}

.element-information-wrapper-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: grid;
  width: 17vw;
  grid-template-rows: max-content 1fr;
  grid-row-gap: 10px;

}

.element-information {
  overflow: auto;
}

.periodic-table {
  position: relative;
  display: grid;
}
</style>
