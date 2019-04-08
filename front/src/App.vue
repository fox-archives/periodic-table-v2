<template>
  <div class="app"
    :style="currentTheme.app.default"
  >
    <navigation />
    <router-view class="router-view" />
    <foot />
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
.app {
  display: grid;
  grid-template-rows: max-content 1fr max-content;
  height: 100vh;
}
</style>
