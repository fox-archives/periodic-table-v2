import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // The navigation bar
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

  // The large icon text or graphic, enlarged view of basic atom data
  elementGraphic: {
    default: {
      backgroundColor: oc.white,
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

  // List of all information of a particular atom
  elementInformation: {
    // Box that surrounds all the boxes of information. It contains all elementInformation
    information: {
      default: {
        border: "1px solid " + oc.gray2,
        transition: "box-shadow .15s"
      },
      hover: {
        border: "1px solid " + oc.gray2,
        boxShadow: "2px 2px 4px " + oc.gray1,
        transition: "box-shadow .15s"
      }
    },
    // The actual box with one piece of information
    box: {
      default: {
        border: "1px solid " + oc.gray2
      },
      hover: {
        border: "1px solid " + oc.gray2,
        boxShadow: "2px 2px 2px " + oc.gray1 // Enabling this causes *all* the boxes to have hover
      }
    }
  },

  // The periodic table in general
  periodicTable: {
    default: {
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      border: "1px solid " + oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray1,
      transition: "box-shadow .15s"
    }
  },

  // Each single element (element-inner) styling
  element: {
    default: {
      border: "1px solid " + oc.gray2,
      transition: "box-shadow .15s"
    },
    hover: {
      border: "1px solid " + oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray8,
      transition: "box-shadow .15s"
    }
  }
};
