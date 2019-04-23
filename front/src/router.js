import Vue from "vue";
import Router from "vue-router";
import PropertiesTab from "@/views/PropertiesTab";

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
      component: PropertiesTab,
      meta: {
        tab: "properties"
      }
    },
    {
      path: "/electrons",
      component: () => import("@/views/ElectronsTab"),
      meta: {
        tab: "electrons"
      }
    },
    {
      path: "/orbitals",
      component: () => import("@/views/OrbitalsTab"),
      meta: {
        tab: "orbitals"
      }
    },
    {
      path: "/isotopes",
      component: () => import("@/views/IsotopesTab"),
      meta: {
        tab: "isotopes"
      }
    },
    {
      path: "/explore",
      component: () => import("@/views/ExploreTab"),
      meta: {
        tab: "explore"
      }
    },
    {
      path: "/trivia",
      component: () => import("@/views/TriviaTab"),
      meta: {
        tab: "trivia"
      }
    }
  ]
});
