<template>
  <div class="graphic-outer">
    <div class="graphic">
      <div class="graphic-inner">
        <p>{{ selectedElement.atomicNumber }}</p>
        <p>{{ selectedElement.abbreviation }}</p>
        <p>{{ selectedElement.name }}</p>
        <p>{{ selectedElement.atomicWeight }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "ElementGraphic",
  computed: {
    ...mapGetters("elementData/", ["selectedElement"])
  }
};
</script>

<style scoped>
.graphic-outer {
  margin: 5px;
}
.graphic {
  position: relative;
  height: 0;
  width: 100%;
  padding-bottom: 100%;
  background-color: lightblue;
}
.graphic-inner {
  height: 100%;
  width: 100%;
  position: absolute;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
