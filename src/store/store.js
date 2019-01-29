import Vue from "vue";
import Vuex from "vuex";
import elementData from "@/store/modules/element-data/elementData";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    elementData
  }
  // state: {},
  // mutations: {},
  // actions: {}
});
