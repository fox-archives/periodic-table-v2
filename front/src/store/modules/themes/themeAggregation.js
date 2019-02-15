import lightTheme from "@/store/modules/themes/lightTheme";
import darkTheme from "@/store/modules/themes/darkTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme",
    navigationTheme: lightTheme
  },
  lightTheme: lightTheme,
  darkTheme: darkTheme,
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
