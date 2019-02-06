const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default
  currentTheme: {
    name: "Light Theme",
    navigationTheme: {
      default: {
        backgroundColor: "orange"
      },
      hover: {
        backgroundColor: "red"
      },
      click: {
        backgroundColor: "purple"
      },
      navItemBg: "#fff0ff",
      navItemHoverBg: "red"
    }
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
