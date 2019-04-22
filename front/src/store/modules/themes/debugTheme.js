import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // The overall app, like the background and stuff
  app: [
    { "background-color": oc.black }
  ],
  // The navigation bar
  navigation: [
    { "--background-color": oc.gray9 },
    { "--background-color_hover": oc.gray8 },
    { "--border": oc.blue8 },
    { "--box-shadow": oc.gray5 },
    { "--color": oc.gray3 }
  ],

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
  atom: {
    default: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.yellow8,
      boxShadow: "1px 1px 2px " + oc.gray6,
      color: oc.gray3,
      transition: "all .15s"
    },
    hover: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.yellow8,
      boxShadow: "2px 2px 4px " + oc.gray6,
      color: oc.gray3,
      transition: "all .15s"
    }
  },

  // Each column and row label (label-inner) styling
  label: [
    { "--background-color": oc.gray8 },
    { "--border": oc.orange8 },
    { "--box-shadow": oc.gray6 },
    { "--box-shadow_hover": oc.gray4 },
    { "--color": oc.gray3 }
  ],

  footer: [{ "--color": oc.gray3 }]
};
