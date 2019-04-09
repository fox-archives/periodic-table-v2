<template>
  <div class="app-outer" :style="currentTheme.app.default">
    <div class="app">
      <navigation />
      <router-view class="router-view" />
      <foot />
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import Navigation from "@/components/navigation/Navigation";
import Foot from "@/components/foot/Foot";

export default {
  name: "App",
  computed: {
    ...mapState("themes", ["currentTheme"])
  },
  components: {
    navigation: Navigation,
    foot: Foot
  }
};
</script>

<style lang="scss">
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  font-family: Arial; //TODO: Temp
}

.app-outer {
  height: 100vh;
  width: 100vw;
}

.app {
  display: grid;
  grid-template-rows: max-content 1fr max-content;
  margin: 0 10px;
  height: 100%;
  // If this is enabled, then scrollbar appears (since margin is added to the width of 100%
  /*width: 100%;*/
}
</style>
