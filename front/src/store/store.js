import Vue from "vue";
import Vuex from "vuex";
import themes from "@/store/modules/themes/themes";
import atomData from "@/store/modules/atom-data/atomData";
import labelData from "@/store/modules/label-data/labelData";

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        themes,
        atomData,
        labelData
    }
});
