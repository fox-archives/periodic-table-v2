import lightTheme from "@/store/modules/themes/lightTheme.js";
let ocGray1 = "#f1f3f5";
let ocGray3 = "#dee2e6";
let ocGray5 = "#adb5bd";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme",
    navigationTheme: lightTheme
  },
  lightTheme: {},
  darkTheme: {},
  outlineTheme: {}
};

const getters = {};

const mutations = {};

const actions = {};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
};
