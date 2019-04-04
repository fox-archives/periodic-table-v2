import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // The navigation bar
  navigation: {
    default: {
      backgroundColor: oc.gray0,
      boxShadow: "2px 2px 4px " + oc.gray1,
      // boxShadow: "2px 2px 2px " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray1,
      boxShadow: "2px 2px 4px " + oc.gray3,
      transition: "box-shadow .15s"
    },
    click: {
      backgroundColor: oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray4,
      transition: "box-shadow .15s"
    }
  },

  // The large icon text or graphic, enlarged view of basic atom data
  elementGraphic: {
    default: {
      backgroundColor: oc.gray0,
      boxShadow: "2px 2px 4px " + oc.gray1,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray0,
      boxShadow: "2px 2px 4px " + oc.gray2,
      transition: "box-shadow .15s"
    }
  },

  // List of all information of a particular atom
  elementInformation: {
    // Box that surrounds all the boxes of information. It contains all elementInformation
    information: {
      default: {
        backgroundColor: oc.gray0,
        boxShadow: "2px 2px 4px " + oc.gray1,
        transition: "box-shadow .15s"
      },
      hover: {
        backgroundColor: oc.gray0,
        boxShadow: "2px 2px 4px " + oc.gray2,
        transition: "box-shadow .15s"
      }
    },
    // The actual box with one piece of information
    box: {
      default: {
        backgroundColor: oc.gray1,
        // border: "1px solid " + oc.gray2
        transition: "box-shadow .15s"
      },
      hover: {
        backgroundColor: oc.gray1,
        // border: "1px solid " + oc.gray2,
        boxShadow: "2px 2px 2px " + oc.gray3
      }
    }
  },

  // The periodic table in general
  periodicTable: {
    default: {
      backgroundColor: oc.gray0,
      boxShadow: "2px 2px 4px " + oc.gray1,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray0,
      boxShadow: "2px 2px 4px " + oc.gray2,
      transition: "box-shadow .15s"
    }
  },

  // Each single element (element-inner) styling
  element: {
    default: {
      backgroundColor: oc.gray1,
      boxShadow: "2px 2px 4px " + oc.gray2,
      // border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray1,
      // border: "1px solid " + oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray8,
      transition: "box-shadow .15s"
    }
  }
};
