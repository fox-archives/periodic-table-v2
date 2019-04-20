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
  updateActiveLabel: function() {
    console.log("test");
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations
};
