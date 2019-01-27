export default {
  fetchBasicData: function(context) {
    // Only fetch the data if it does not already exist
    if (
      !Array.isArray(context.state.basicElementsData) ||
      !context.state.basicElementsData.length
    ) {
      fetch("http://localhost:3000/" + "basicData")
        .then(response => {
          return response.json();
        })
        .then(myJson => {
          context.state.elementsBasic = myJson;
        });
    }
  },
  fetchTabsElementsData: function(context, payload) {
    let route = "propertiesData";
    if (payload.tab === "properties") {
      route = "propertiesData";
    } else if (payload.tab === "electrons") {
      route = "electronsData";
    }

    fetch("http://localhost:3000/" + route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.elementsTab = myJson;
      });
  },
  fetchTabsElementsVariableData: function(context, payload) {
    let route = "tabsElementsPropertiesVariableData";
    if (payload.tab === "properties") {
      route = "tabsElementsPropertiesVariableData";
    } else if (payload.tab === "electrons") {
      route = "tabsElementsElectronsVariableData";
    }

    fetch("http://localhost:3000/" + route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.elementsTabSpecific = myJson;
      });
  }
};
