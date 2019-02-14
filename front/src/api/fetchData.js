export default {
  fetchUpdateTabAtomsData: function(context, payload) {
    let route = "propertiesTabAtomData";
    if (payload.tab === "properties") {
      route = "api/json/thermodynamic-data.json";
    } else if (payload.tab === "electrons") {
      route = "api/json/atomic-data.json";
    }
    fetch(route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.tabAtomsData = myJson;
      })
      // Update selectedAtom with new data
      .then(() => {
        let selectedAtomAtomicNumber = context.state.selectedAtom.atomicNumber;
        context.commit("updateSelectedAtom", selectedAtomAtomicNumber);
      })
      .catch(err => {
        // console.log(err);
      });
  },
  fetchSpecificAtomData: function(context, payload) {
    let route = "propertiesSpecificAtomsData";
    if (payload.tab === "properties") {
      route = "api/json/propertiesSpecificAtomsData";
    } else if (payload.tab === "electrons") {
      route = "api/json/electronsSpecificAtomsData";
    }

    fetch(route)
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        context.state.specificAtomsData = myJson;
      })
      .catch(err => {
        // console.log(err);
      });
  }
};
