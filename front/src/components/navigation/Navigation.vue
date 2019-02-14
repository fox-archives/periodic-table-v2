<template>
<nav class="navigation">
  <ul class="navigation-list">
    <router-link tag="p" to="/properties">
      <nav-item>PRoperties Normal</nav-item>
    </router-link>
    <router-link tag="p" to="/electrons">
      <nav-item>Electrons</nav-item>
    </router-link>
    <router-link tag="p" to="/orbitals">
      <nav-item>Orbitals</nav-item>
    </router-link>
    <router-link tag="p" to="/isotopes">
      <nav-item>Isotopes</nav-item>
    </router-link>
    <router-link tag="p" to="/">
      <nav-item>Explore</nav-item>
    </router-link>
    <router-link tag="p" to="/trivia">
      <nav-item>Trivia</nav-item>
    </router-link>
  </ul>
</nav>
</template>

<script>
import NavItem from "@/components/navigation/NavItem";

export default {
  name: "Navigation",
  components: {
    "nav-item": NavItem
  }
};
</script>

<style scoped lang="scss">
.navigation-list {
  display: flex;
  list-style-type: none;
}
</style>
