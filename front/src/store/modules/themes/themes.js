import darkThemeRegular from "@/store/modules/themes/darkThemeRegular";
import debugTheme from "@/store/modules/themes/debugTheme";

const state = {
  // For now, add lightTheme in currentTheme. Do replacing, etc. later
  // When naming descriptions of themes, omit color, because it should be implied by default

  currentTheme: {
    name: "Light Theme Regular",
    ...darkThemeRegular
  },
  darkThemeRegular: {
    name: "Dark Theme Regular",
    ...darkThemeRegular
  }
};

export default {
  namespaced: true,
  state
};
