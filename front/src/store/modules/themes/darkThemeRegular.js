import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // Root app instance
  app: [{ "--background-color": oc.black }],

  // Navigation bar
  navigation: [
    { "--background-color": oc.gray9 },
    { "--background-color_hover": oc.gray8 },
    { "--box-shadow_hover": oc.gray7 },
    { "--box-shadow_active": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  // Box surrounding the element atomic number, abbreviation, and the name
  atomGraphic: [
    { "--background-color": oc.gray9 },
    { "--box-shadow": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  // List of all information of a particular atom
  atomInformation: [
    { "--background-color": oc.gray9 },
    { "--box-shadow": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  atomInformationBox: [
    { "--background-color": oc.gray8 },
    { "--background-color_hover": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  // The periodic table in general
  periodicTable: [
    { "--background-color": oc.gray9 },
    { "--box-shadow": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 }
  ],

  // Each single atom (atom-inner) styling
  atom: [
    { "--background-color": oc.gray8 },
    { "--box-shadow": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  // Each column and row label (label-inner) styling
  label: [
    { "--background-color": oc.gray8 },
    { "--background-color_c-active": oc.gray7 },
    { "--box-shadow": oc.gray7 },
    { "--box-shadow_hover": oc.gray6 },
    { "--color": oc.gray3 }
  ],

  // Footer
  footer: [{ "--color": oc.gray3 }]
};
