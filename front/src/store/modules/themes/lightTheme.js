import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  navigation: {
    default: {
      backgroundColor: oc.white,
      // boxShadow: "2px 2px 2px " + oc.gray2,
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray1,
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    click: {
      backgroundColor: oc.gray4,
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    }
  },

  elementGraphic: {
    default: {
      backgroundColor: oc.white,
      // boxShadow: "2px 2px 2px " + oc.gray2,
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.white,
      boxShadow: "2px 2px 4px " + oc.gray1,
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    }
  },

  elementInformation: {}
};
