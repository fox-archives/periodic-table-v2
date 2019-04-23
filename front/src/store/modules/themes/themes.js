import lightThemeRegular from "@/store/modules/themes/lightThemeRegular";
import lightThemeOutline from "@/store/modules/themes/lightThemeOutline";
import darkThemeRegular from "@/store/modules/themes/darkThemeRegular";
import debugTheme from "@/store/modules/themes/debugTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme Regular",
    ...debugTheme
  },
  lightThemeRegular: {
    name: "Light Theme Regular",
    ...lightThemeRegular
  },
  lightThemeOutline: {
    name: "Bare Theme",
    ...lightThemeOutline
  },
  darkThemeRegular: {
    name: "Dark Theme Regular",
    ...darkThemeRegular
  },
  darkThemeOutline: {}
};

export default {
  namespaced: true,
  state
};
