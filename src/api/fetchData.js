export default {
  fetchUpdateTabAtomsData: function(context, payload) {
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
      })
      // Update selectedAtom with new data
      .then(() => {
        let selectedAtomAtomicNumber = context.state.selectedAtom.atomicNumber;
        context.commit("updateSelectedAtom", selectedAtomAtomicNumber);
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
