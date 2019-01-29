import api from "@/api/fetchData";
// import helper from "@/store/modules/element-data/helper";

const state = {
  tabAtomsData: [], // Atom data that's dependent on the selected tab
  specificAtomsData: [], // Bottom of each element-z

  selectedAtom: {
    Name: "Hydrogen",
    abbreviation: "H",
    atomicNumber: 1,
    atomicWeight: 1.008
    // Other property data needs to be fetched on a per-route basis (do NOT add it here)
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
  // Updates selectedAtom in state, giving that object all existing properties of selected atom
  updateSelectedAtom: function(state, atomicNumber) {
    // Convert atomicNumber to index
    let index = atomicNumber - 1;

    // Extract atom from list of tabAtomsData
    let elementTab = state.tabAtomsData[index];

    state.selectedAtom = {}; // Object.assign does not clear old properties, so this does (inefficient, but works)
    state.selectedAtom = Object.assign({}, state.selectedAtom, elementTab);
  }
};

const actions = {
  fetchUpdatePeriodicTableData: function(context, payload) {
    // Fetch the bulk of the element data (most of the data), which depends on the current tab
    api.fetchUpdateTabAtomsData(context, payload);

    // Fetch the specificAtomsData (shows up on each element of the periodic table (at the bottom
    // of the element) and changes on route change, and on click of property on side panel (ElementInformation.vue)
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
