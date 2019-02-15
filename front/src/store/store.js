import Vue from "vue";
import Vuex from "vuex";
import elementData from "@/store/modules/element-data/elementData";
import themes from "@/store/modules/themes/themeAggregation.js";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    elementData,
    themes
  }
});
