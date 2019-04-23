<template>
  <nav class="navigation" :style="[...currentTheme.navigationBar]">
    <ul class="navigation-list">
      <router-link tag="p" to="/properties">
        <nav-item>Properties</nav-item>
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
      <router-link tag="p" to="/explore">
        <nav-item>Explore</nav-item>
      </router-link>
      <router-link tag="p" to="/trivia">
        <nav-item>Trivia</nav-item>
      </router-link>
    </ul>
  </nav>
</template>

<script>
import { mapState } from "vuex";
import NavItem from "@/components/navigation/NavItem";

export default {
  name: "Navigation",
  computed: {
    ...mapState("themes/", ["currentTheme"])
  },
  components: {
    "nav-item": NavItem
  }
};
</script>

<style scoped lang="css">
.navigation {
  margin-bottom: 5px;
}

.navigation-list {
  display: flex;
  list-style-type: none;
}

.router-link-active li {
  background-color: var(--background-color_c-router-link-active) !important;
}
</style>
