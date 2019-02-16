import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  default: {
    backgroundColor: oc.white,
    // boxShadow: "5px 5px 5px " + oc.gray2,
    border: "1px solid " + oc.gray2,
    transition: "all .1s"
  },
  hover: {
    backgroundColor: oc.gray2,
    // boxShadow: "5px 5px 5px " + oc.gray4,
    border: "1px solid " + oc.gray2,
    transition: "all .1s"
  },
  click: {
    backgroundColor: oc.gray4,
    border: "1px solid " + oc.gray2,
    transition: "all .1s"
  }
};
