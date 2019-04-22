import Vue from "vue";
import atomPlacements from "../../../../../wolf/generic-atom-data/placement.json";

const state = {
  // 7
  periodLabels: new Array(7).fill({ active: false }),
  activePeriodLabel: -1,
  // 18
  groupLabels: new Array(18).fill({ active: false }),
  activeGroupLabel: -1
};

const getters = {};

const mutations = {
  updateActiveLabel: function(state, index) {
    let atomPlacement = atomPlacements[index];
    // Reset the old values
    Vue.set(state.periodLabels, state.activePeriodLabel - 1, { active: false });
    Vue.set(state.groupLabels, state.activeGroupLabel - 1, { active: false });

    // Set the new values
    Vue.set(state.periodLabels, atomPlacement.period - 1, { active: true });
    state.activePeriodLabel = atomPlacement.period;

    Vue.set(state.groupLabels, atomPlacement.group - 1, { active: true });
    state.activeGroupLabel = atomPlacement.group;
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations
};
