import bareLightTheme from "@/store/modules/themes/bareLightTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Bare Theme",
    ...bareLightTheme
  },
  lightTheme: {
    name: "Bare Theme",
    ...bareLightTheme
  },
  darkTheme: {},
  outlineTheme: {}
};

export default {
  namespaced: true,
  state
};
