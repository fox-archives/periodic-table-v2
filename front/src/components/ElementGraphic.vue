<template>
  <div
    class="graphic-outer"
    :style="currentTheme.elementGraphic[mouseState]"
    @mouseenter="mouseState = 'hover'"
    @mouseleave="mouseState = 'default'"
  >
    <div class="graphic">
      <div class="graphic-inner">
        <p>{{ selectedAtom.atomicNumber }}</p>
        <p>{{ selectedAtom.abbreviation }}</p>
        <p>{{ selectedAtom.name }}</p>
        <p>{{ selectedAtom.atomicWeight }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "ElementGraphic",
  data() {
    return {
      mouseState: "default"
    };
  },
  computed: {
    ...mapState("themes/", ["currentTheme"]),
    ...mapState("elementData/", ["selectedAtom"])
  }
};
</script>

<style scoped>
.graphic-outer {
  margin: 5px;
  border-radius: 5px;
}

.graphic {
  position: relative;
  height: 0;
  width: 100%;
  padding-bottom: 100%;
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
