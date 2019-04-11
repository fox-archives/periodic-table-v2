<template>
  <div class="interface">
    <div class="atom-information-wrapper">
      <div class="atom-information-wrapper-inner">
        <atom-graphic class="atom-graphic" />
        <atom-information class="atom-information" />
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
import AtomGraphic from "@/components/AtomGraphic";
import AtomInformation from "@/components/AtomInformation";
import PeriodicTable from "@/components/PeriodicTable";

export default {
  name: "Interface",
  components: {
    "atom-graphic": AtomGraphic,
    "atom-information": AtomInformation,
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

.atom-information-wrapper {
  position: relative;
  width: 17vw;
}

.atom-information-wrapper-inner {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: grid;
  grid-template-rows: max-content 1fr;
  grid-row-gap: 10px;
}

.atom-information {
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
