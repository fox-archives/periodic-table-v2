import Vue from "vue";
import Vuex from "vuex";
import atomData from "@/store/modules/atom-data/atomData";
import themes from "@/store/modules/themes/themeAggregation.js";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    atomData,
    themes
  }
});
