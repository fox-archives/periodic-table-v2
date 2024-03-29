import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // Root app instance
  app: [{ "--background-color": oc.black }],

  // Navigation bar
  navigationBar: [{ "--background-color_c-router-link-active": oc.gray7 }],

  navigationItem: [
    { "--background-color": oc.gray9 },
    { "--background-color_hover": oc.gray8 },
    { "--border": oc.blue8 },
    { "--box-shadow": oc.gray5 },
    { "--color": oc.gray3 }
  ],

  // Box surrounding the element atomic number, abbreviation, and the name
  atomGraphic: [
    { "--background-color": oc.gray9 },
    { "--border": oc.grape8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  // Box that surrounds all the boxes of information. It contains all atomInformation
  atomInformation: [
    { "--background-color": oc.gray9 },
    { "--border": oc.red8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  atomInformationBox: [
    { "--background-color": oc.gray8 },
    { "--border": oc.green8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  // The periodic table in general
  periodicTable: [
    { "--background-color": oc.gray9 },
    { "--border": oc.violet8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 }
  ],

  // Each single atom (atom-inner) styling
  atom: [
    { "--background-color": oc.gray8 },
    { "--background-color_c-active": oc.gray7 },
    { "--border": oc.yellow8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  // Each column and row label (label-inner) styling
  label: [
    { "--background-color": oc.gray8 },
    { "--background-color_c-active": oc.gray7 },
    { "--border": oc.orange8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  // Footer
  footer: [{ "--color": oc.gray3 }]
};
