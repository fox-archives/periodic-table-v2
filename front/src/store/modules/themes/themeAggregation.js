import lightTheme from "@/store/modules/themes/lightTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme",
    ...lightTheme
  },
  lightTheme: {
    name: "Light Theme",
    ...lightTheme
  },
  darkTheme: {},
  outlineTheme: {}
};

export default {
  namespaced: true,
  state
};
