import api from "@/api/fetchData";

const state = {
  elementsData: []
};

const getters = {
  getElementsData: function(state) {
    return state.elementsData;
  }
};

const mutations = {};

const actions = {
  fetchElementsData: function(context, payload) {
    let route = "properties";
    if (payload.tab === "properties") {
      route = "properties";
    } else if (payload.tab === "electrons") {
      route = "electrons";
    }

    fetch("http://localhost:3000/" + route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.elementsData = myJson;
      });
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
};
