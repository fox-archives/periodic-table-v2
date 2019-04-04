import lightThemeBare from "@/store/modules/themes/lightThemeBare";
import lightThemeRegular from "@/store/modules/themes/lightThemeRegular";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Bare Theme",
    ...lightThemeRegular
  },
  lightThemeBare: {
    name: "Bare Theme",
    ...lightThemeBare
  },
  lightThemeRegular: {
    name: "Light Theme Regular",
    ...lightThemeRegular
  },
  darkTheme: {},
  outlineTheme: {}
};

export default {
  namespaced: true,
  state
};
