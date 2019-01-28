export default {
  fetchTabAtomsData: function(context, payload) {
    let route = "propertiesTabAtomData";
    if (payload.tab === "properties") {
      route = "propertiesTabAtomData";
    } else if (payload.tab === "electrons") {
      route = "electronsTabAtomData";
    }

    fetch("http://localhost:3000/" + route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.tabAtomsData = myJson;
      });
  },
  fetchSpecificAtomData: function(context, payload) {
    let route = "propertiesSpecificAtomsData";
    if (payload.tab === "properties") {
      route = "propertiesSpecificAtomsData";
    } else if (payload.tab === "electrons") {
      route = "electronsSpecificAtomsData";
    }

    fetch("http://localhost:3000/" + route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.specificAtomsData = myJson;
      });
  }
};
