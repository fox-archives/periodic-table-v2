import Vue from "vue";
import api from "@/api/fetchData";
import atomPlacements from "../../../../../wolf/generic-atom-data/placement.json";

const state = {
  tabAtomsData: [], // Atom data that's dependent on the selected tab
  specificAtomsData: [], // Bottom of each atom-z

  /* This atom shows in the sidebar */
  selectedAtom: {
    name: "Hydrogen",
    abbreviation: "H",
    atomicNumber: 1,
    atomicWeight: 1.008
    // Other property data needs to be fetched on a per-route basis (do NOT add it here)
  },

  activeAtoms: new Array(120).fill({ active: false }),
  activeAtomsLastActive: []
};

const mutations = {
  // Updates selectedAtom in state, giving that object all existing properties of selected atom
  updateSelectedAtom: function(state, atomicNumber) {
    // Convert atomicNumber to index
    let index = atomicNumber - 1;

    // Extract atom from list of tabAtomsData
    let atomFromTabsAtomsData = state.tabAtomsData[index];

    state.selectedAtom = atomFromTabsAtomsData;
    // state.selectedAtom = {}; // Object.assign does not clear old properties, so this does (inefficient, but works)
    // state.selectedAtom = Object.assign({}, state.selectedAtom, atomTab);
  },
  updateSpecificAtomsData: function(state, key) {
    let newSpecificAtomsData = [];
    for (let i = 0; i < state.tabAtomsData.length; i++) {
      let property = state.tabAtomsData[i][key];
      newSpecificAtomsData.push(property);
    }
    state.specificAtomsData = newSpecificAtomsData;
  },
  updateActiveAtoms: function(state, payload) {
    let labelIndex, labelType;
    ({ labelIndex, labelType } = payload);

    if (labelType === "period") labelType = "period";
    if (labelType === "group") labelType = "group";
    // console.log(labelType);

    // Reset the old values
    state.activeAtomsLastActive.forEach(atomsLastActive => {
      Vue.set(state.activeAtoms, atomsLastActive, { active: false });
    });
    state.activeAtomsLastActive = [];

    // labelIndex of -1 means we want to remove any labels
    if (labelIndex === -1) return;

    // TODO: PRIORITY 2: Refactor for better perf
    atomPlacements.forEach((atomPlacement, index) => {
      if (atomPlacement[labelType] === labelIndex + 1) {
        Vue.set(state.activeAtoms, index, { active: true });
        state.activeAtomsLastActive.push(index);
      }
    });
  }
};

const actions = {
  fetchUpdatePeriodicTableData: function(context, payload) {
    // Fetch the bulk of the atom data (most of the data), which depends on the current tab
    api.fetchUpdateTabAtomsData(context, payload);

    // Fetch the specificAtomsData (shows up on each atom of the periodic table (at the bottom
    // of the atom) and changes on route change, and on click of property on side panel (AtomInformation.vue)
    api.fetchSpecificAtomData(context, payload);
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  actions
};
