import Vue from "vue";
import api from "@/api/fetchData";

const state = {
  tabAtomsData: [], // Atom data that's dependent on the selected tab
  specificAtomsData: [], // Bottom of each element-z

  selectedAtom: {
    name: "Hydrogen",
    abbreviation: "H",
    atomicNumber: 1,
    atomicWeight: 1.008
    // Add other properties
  }
};

const getters = {
  tabAtomsData: function(state) {
    return state.tabAtomsData;
  },
  specificAtomsData: function(state) {
    return state.specificAtomsData;
  },
  selectedAtom: function(state) {
    return state.selectedAtom;
  }
};

const mutations = {
  // Updates selectedAtom in state, giving that object all existing properties of a particular element
  updateSelectedElement: function(state, atomicNumber) {
    // Convert atomicNumber to index
    let index = atomicNumber - 1;

    // Extract element from list of tabAtomsData
    let elementTab = state.tabAtomsData[index];

    // Vue.set(state.selectedAtom, obj);
    state.selectedAtom = Object.assign({}, state.selectedAtom, elementTab);
  }
};

const actions = {
  fetchPeriodicTableData: function(context, payload) {
    // Fetch the bulk of the element data (most of the data), which depends on the current tab
    api.fetchTabAtomsData(context, payload);

    // Fetch the tabsElementsVariableData (shows up on each element of the periodic table (at the bottom
    // of the element) and changes on route change, and click on a property (that's looped in ElementInformation.vue)
    api.fetchSpecificAtomData(context, payload);
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
};
