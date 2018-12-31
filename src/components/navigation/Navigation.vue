<template>
<nav class="navigation">
  <nav-item>
    <router-link to="/properties">Properties</router-link>
  </nav-item>
  <nav-item>
    <router-link to="/electrons">Electrons</router-link>
  </nav-item>
  <nav-item>
    <router-link to="/orbitals">Orbitals</router-link>
  </nav-item>
  <nav-item>
    <router-link to="/isotopes">Isotopes</router-link>
  </nav-item>
  <nav-item>
    <router-link to="/explore">Explore</router-link>
  </nav-item>
  <nav-item>
    <router-link to="/trivia">Trivia</router-link>
  </nav-item>
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
.navigation {
  display: flex;

  & * {
    margin-right: 10px;
  }
}
</style>
