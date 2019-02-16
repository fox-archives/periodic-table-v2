import lightNavigationTheme from "@/store/modules/themes/lightNavigationTheme";
import lightGraphicTheme from "@/store/modules/themes/lightGraphicTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme",
    navigationTheme: lightNavigationTheme,
    elementGraphicTheme: lightGraphicTheme
  },
  lightTheme: {},
  darkTheme: {},
  outlineTheme: {}
};

export default {
  namespaced: true,
  state
};
