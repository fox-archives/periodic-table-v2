import Vue from "vue";
import Vuex from "vuex";
import elementData from "@/store/modules/element-data/elementData";
import variables from "@/store/modules/variables/variables";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    elementData,
    variables
  }
  // state: {},
  // mutations: {},
  // actions: {}
});
