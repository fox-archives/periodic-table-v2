import Vue from "vue";
import api from "@/api/fetchData";

const state = {
  elementsBasic: [],
  elementsTab: [],
  elementsTabSpecific: [], // That piece of data at the bottom of each element square on the actual periodic table

  selectedElement: {
    name: "Hydrogen",
    abbreviation: "H",
    atomicNumber: 1,
    atomicWeight: 1.008
    // Add other properties
  }
};

const getters = {
  basicElements: function(state) {
    return state.elementsBasic;
  },
  elementsTab: function(state) {
    return state.elementsTab;
  },
  tabElementsSpecific: function(state) {
    return state.elementsTabSpecific;
  },
  selectedElement: function(state) {
    return state.selectedElement;
  }
};

const mutations = {
  // Updates selectedElement in state, giving that object all existing properties of a particular element
  updateSelectedElement: function(state, atomicNumber) {
    // Convert atomicNumber to index
    let index = atomicNumber - 1;

    // Extract element from list of elementsBasic
    let elementBasic = state.elementsBasic[index];

    // Extract element from list of elementsTab
    let elementTab = state.elementsTab[index];

    // Set state
    const obj = {
      ...elementBasic,
      ...elementTab
    };

    Vue.set(state.selectedElement, obj);
    state.selectedElement = Object.assign({}, state.selectedElement, obj);
  }
};

const actions = {
  fetchPeriodicTableData: function(context, payload) {
    // Fetch the basicElement data (shows up on each element of the periodic table) and does not change
    api.fetchBasicData(context);

    // Fetch the bulk of the element data (most of the data), which depends on the current tab
    api.fetchTabsElementsData(context, payload);

    // Fetch the tabsElementsVariableData (shows up on each element of the periodic table (at the bottom
    // of the element) and changes on route change, and click on a property (that's looped in ElementInformation.vue)
    api.fetchTabsElementsVariableData(context, payload);
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
};
