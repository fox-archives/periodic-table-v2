<template>
  <div id="app">
    <navigation class="nav">Edwin</navigation>
    <router-view/>
  </div>
</template>

<script>
import Navigation from "@/components/navigation/Navigation";

export default {
  name: "App",
  components: {
    navigation: Navigation
  }
};
</script>

<style lang="scss">
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
