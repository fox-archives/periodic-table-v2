import Vue from "vue";
import Router from "vue-router";
import Properties from "./views/PropertiesTab.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      redirect: "/properties"
    },
    {
      path: "/properties",
      component: Properties
    },
    {
      path: "/electrons",
      component: () => import("@/views/ElectronsTab")
    },
    {
      path: "/orbitals",
      component: () => import("@/views/OrbitalsTab")
    },
    {
      path: "/isotopes",
      component: () => import("@/views/IsotopesTab")
    },
    {
      path: "/explore",
      component: () => import("@/views/ExploreTab")
    },
    {
      path: "/trivia",
      component: () => import("@/views/TriviaTab")
    }
  ]
});
