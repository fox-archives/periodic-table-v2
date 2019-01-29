<template>
  <div class="graphic-outer">
    <div class="graphic">
      <div class="graphic-inner">
        <p>{{ selectedAtom[ATOMIC_NUMBER] }}</p>
        <p>{{ selectedAtom[ABBREVIATION] }}</p>
        <p>{{ selectedAtom[NAME] }}</p>
        <p>{{ selectedAtom[ATOMIC_WEIGHT] }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "ElementGraphic",
  computed: {
    ...mapState("variables/", [
      "ATOMIC_NUMBER",
      "ABBREVIATION",
      "NAME",
      "ATOMIC_WEIGHT"
    ]),
    ...mapState("elementData/", ["selectedAtom"])
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
