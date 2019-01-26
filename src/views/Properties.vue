<template>
  <div class="home">
    <h1>Properties</h1>
    <periodic-table>
      <!--<template>-->
        <chem-element slot-scope="newProp" :elementData="newProp.propElementObject"></chem-element>
      <!--</template>-->
    </periodic-table>
  </div>
</template>

<script>
import Element from "@/components/TableElement";
import PeriodicTable from "@/components/PeriodicTable";

export default {
  name: "Properties",
  components: {
    "chem-element": Element,
    "periodic-table": PeriodicTable
  }
};
</script>
