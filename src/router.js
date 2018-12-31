import Vue from "vue";
import Router from "vue-router";
import Properties from "./views/Properties.vue";

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
      component: () => import("@/views/Electrons")
    },
    {
      path: "/orbitals",
      component: () => import("@/views/Orbitals")
    },
    {
      path: "/isotopes",
      component: () => import("@/views/Isotopes")
    },
    {
      path: "/explore",
      component: () => import("@/views/Explore")
    },
    {
      path: "/trivia",
      component: () => import("@/views/Trivia")
    }
  ]
});
