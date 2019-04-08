import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  // The overall app, like the background and stuff
  app: {
    default: {
      backgroundColor: oc.black
    }
  },
  // The navigation bar
  navigation: {
    default: {
      backgroundColor: oc.gray9,
      // boxShadow: "2px 2px 4px " + oc.gray9,
      color: oc.gray3,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray8,
      boxShadow: "2px 2px 4px " + oc.gray7,
      color: oc.gray3,
      transition: "box-shadow .15s"
    },
    click: {
      backgroundColor: oc.gray8,
      boxShadow: "2px 2px 4px " + oc.gray6,
      color: oc.gray3,
      transition: "box-shadow .15s"
    }
  },

  // The large icon text or graphic, enlarged view of basic atom data
  elementGraphic: {
    default: {
      backgroundColor: oc.gray9,
      boxShadow: "2px 2px 4px " + oc.gray7,
      color: oc.gray3,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray9,
      boxShadow: "2px 2px 4px " + oc.gray6,
      color: oc.gray3,
      transition: "box-shadow .15s"
    }
  },

  // List of all information of a particular atom
  elementInformation: {
    // Box that surrounds all the boxes of information. It contains all elementInformation
    information: {
      default: {
        backgroundColor: oc.gray9,
        boxShadow: "2px 2px 4px " + oc.gray7,
        color: oc.gray3,
        transition: "box-shadow .15s"
      },
      hover: {
        backgroundColor: oc.gray9,
        boxShadow: "2px 2px 4px " + oc.gray6,
        color: oc.gray3,
        transition: "box-shadow .15s"
      }
    },
    // The actual box with one piece of information
    box: {
      default: {
        backgroundColor: oc.gray8,
        color: oc.gray3,
        transition: "box-shadow .15s"
      },
      hover: {
        backgroundColor: oc.gray7,
        color: oc.gray3,
        boxShadow: "2px 2px 2px " + oc.gray8
      }
    }
  },

  // The periodic table in general
  periodicTable: {
    default: {
      backgroundColor: oc.gray9,
      boxShadow: "2px 2px 4px " + oc.gray7,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray9,
      boxShadow: "2px 2px 4px " + oc.gray6,
      transition: "box-shadow .15s"
    }
  },

  // Each single element (element-inner) styling
  element: {
    default: {
      backgroundColor: oc.gray8,
      boxShadow: "2px 2px 4px " + oc.gray7,
      // border: "1px solid " + oc.gray2,
      color: oc.gray3,
      transition: "box-shadow .15s"
    },
    hover: {
      backgroundColor: oc.gray8,
      // border: "1px solid " + oc.gray2,
      boxShadow: "2px 2px 4px " + oc.gray6,
      color: oc.gray3,
      transition: "box-shadow .15s"
    }
  }
};
