import api from "@/api/fetchData";

const state = {
  basicElementsData: [],
  tabsElementsData: [],
  // propertiesElementsData: [],
  // electronsElementsData: [],
  // orbitalsElementData: [],
  // isotopesElementsData: [],

  // variableElementsTab: [], // Which tab the variableElementsData came from
  tabsElementsVariableData: [] // That piece of data a the bottom of each element square on the actual periodic table
};

const getters = {
  getBasicElementsData: function(state) {
    return state.basicElementsData;
  },
  getTabsElementsData: function(state) {
    return state.tabsElementsData;
  },
  getTabsElementsVariableData: function(state) {
    return state.tabsElementsVariableData;
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
