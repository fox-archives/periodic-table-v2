import lightTheme from "@/store/modules/themes/lightTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme",
    navigationTheme: lightTheme.navigation,
    elementGraphicTheme: lightTheme.elementGraphic,
    elementInformationTheme: lightTheme.elementInformation
  },
  lightTheme: {
    name: "Light Theme",
    navigationTheme: lightTheme.navigation,
    elementGraphicTheme: lightTheme.elementGraphic,
    elementInformationTheme: lightTheme.elementInformation
  },
  darkTheme: {},
  outlineTheme: {}
};

export default {
  namespaced: true,
  state
};
