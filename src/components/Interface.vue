<template>
  <div class="interface">
    <div class="element-information-wrapper">
      <element-graphic>

      </element-graphic>
      <element-data>

      </element-data>
    </div>
    <periodic-table>
      <element-z slot-scope="newProp" :elementData="newProp.propElementObject"></element-z>
    </periodic-table>
  </div>
</template>

<script>
import ElementGraphic from "@/components/ElementGraphic";
import ElementData from "@/components/ElementData";
import PeriodicTable from "@/components/PeriodicTable";
import Element from "@/components/Element";

export default {
  name: "Interface",
  components: {
    "element-graphic": ElementGraphic,
    "element-data": ElementData,
    "element-z": Element,
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
