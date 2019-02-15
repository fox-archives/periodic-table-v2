import oc from "@/store/modules/themes/commonThemeVariables";

export default {
  default: {
    backgroundColor: "lightskyblue",
    boxShadow: "5px 5px 5px " + oc.yellow4,
    border: "1px solid black"
  },
  hover: {
    backgroundColor: oc.gray3,
    border: "1px solid brown",
    boxShadow: "5px 5px 5px " + oc.blue2,
    transition: "all .1s"
  },
  click: {
    backgroundColor: oc.gray5,
    border: "1px solid brown"
  }
};
