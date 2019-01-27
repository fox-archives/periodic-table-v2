export default {
  fetchBasicData: function(context) {
    // Only fetch the data if it does not already exist
    if (
      !Array.isArray(context.state.basicElementsData) ||
      !context.state.basicElementsData.length
    ) {
      fetch("http://localhost:3000/" + "elementsBasic")
        .then(response => {
          return response.json();
        })
        .then(myJson => {
          context.state.elementsBasic = myJson;
        });
    }
  },
  fetchTabsElementsData: function(context, payload) {
    let route = "elementsTabProperties";
    if (payload.tab === "properties") {
      route = "elementsTabProperties";
    } else if (payload.tab === "electrons") {
      route = "elementsTabElectrons";
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
    let route = "elementsPropertiesSpecific";
    if (payload.tab === "properties") {
      route = "elementsPropertiesSpecific";
    } else if (payload.tab === "electrons") {
      route = "elementsElectronsSpecific";
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
