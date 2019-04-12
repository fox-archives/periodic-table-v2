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
      border: "1px solid " + oc.blue8,
      boxShadow: "1px 1px 2px " + oc.gray5,
      color: oc.gray3,
      transition: "all .15s"
    },
    hover: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.blue8,
      boxShadow: "2px 2px 4px " + oc.gray5,
      color: oc.gray3,
      transition: "all .15s"
    },
    click: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.blue8,
      boxShadow: "2px 2px 4px " + oc.gray5,
      color: oc.gray3,
      transition: "all .15s"
    }
  },

  // The large icon text or graphic, enlarged view of basic atom data
  atomGraphic: {
    default: {
      backgroundColor: oc.gray9,
      border: "1px solid " + oc.grape8,
      boxShadow: "1px 1px 2px " + oc.gray5,
      color: oc.gray3,
      transition: "all .15s"
    },
    hover: {
      backgroundColor: oc.gray9,
      border: "1px solid " + oc.grape8,
      boxShadow: "2px 2px 4px " + oc.gray5,
      color: oc.gray3,
      transition: "all .15s"
    }
  },

  // List of all information of a particular atom
  atomInformation: {
    // Box that surrounds all the boxes of information. It contains all atomInformation
    information: {
      default: {
        backgroundColor: oc.gray9,
        border: "1px solid " + oc.red8,
        boxShadow: "1px 1px 2px " + oc.gray5,
        color: oc.gray3,
        transition: "all .15s"
      },
      hover: {
        backgroundColor: oc.gray9,
        border: "1px solid " + oc.red8,
        boxShadow: "2px 2px 4px " + oc.gray5,
        color: oc.gray3,
        transition: "all .15s"
      }
    },
    // The actual box with one piece of information
    box: {
      default: {
        backgroundColor: oc.gray8,
        border: "1px solid " + oc.green8,
        boxShadow: "1px 1px 2px " + oc.gray5,
        color: oc.gray3,
        transition: "all .15s"
      },
      hover: {
        backgroundColor: oc.gray7,
        border: "1px solid " + oc.green8,
        boxShadow: "2px 2px 4px " + oc.gray5,
        color: oc.gray3,
        transition: "all .15s"
      }
    }
  },

  // The periodic table in general
  periodicTable: {
    default: {
      backgroundColor: oc.gray9,
      border: "1px solid " + oc.violet8,
      boxShadow: "1px 1px 2px " + oc.gray6,
      transition: "all .15s"
    },
    hover: {
      backgroundColor: oc.gray9,
      border: "1px solid " + oc.violet8,
      boxShadow: "2px 2px 4px " + oc.gray6,
      transition: "all .15s"
    }
  },

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
  label: {
    default: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.orange8,
      boxShadow: "1px 1px 2px " + oc.gray6,
      color: oc.gray3,
      transition: "all .15s"
    },
    hover: {
      backgroundColor: oc.gray8,
      border: "1px solid " + oc.orange8,
      boxShadow: "2px 2px 4px " + oc.gray6,
      color: oc.gray3,
      transition: "all .15s"
    }
  }
};
