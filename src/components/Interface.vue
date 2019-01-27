<template>
  <div class="interface">
    <div class="element-information-wrapper">
      <element-graphic>

      </element-graphic>
      <element-information>

      </element-information>
    </div>
    <periodic-table/>
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
  grid-template-columns: max-content 1fr;
  height: 100%;
}

.element-information-wrapper {
  display: flex;
  flex-direction: column;
  width: 17vw;
  height: 100%;
}
</style>
