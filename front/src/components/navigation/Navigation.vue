<template>
<nav class="navigation">
  <ul class="navigation-list">
    <nav-item>
      <router-link tag="p" to="/properties">Properties</router-link>
    </nav-item>
    <nav-item>
      <router-link tag="p" to="/electrons">Electrons</router-link>
    </nav-item>
    <nav-item>
      <router-link tag="p" to="/orbitals">Orbitals</router-link>
    </nav-item>
    <nav-item>
      <router-link tag="p" to="/isotopes">Isotopes</router-link>
    </nav-item>
    <nav-item>
      <router-link tag="p" to="/expldore">Explore</router-link>
    </nav-item>
    <nav-item>
      <router-link tag="p" to="/trivia">Trivia</router-link>
    </nav-item>
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
