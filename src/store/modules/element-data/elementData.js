import api from "@/api/fetchData";

const state = {
  elementsBasic: [],
  elementsTab: [],
  elementsTabSpecific: [] // That piece of data a the bottom of each element square on the actual periodic table
};

const getters = {
  basicElements: function(state) {
    return state.elementsBasic;
  },
  tabElements: function(state) {
    return state.elementsTab;
  },
  tabElementsSpecific: function(state) {
    return state.elementsTabSpecific;
  }
};

const mutations = {};

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
