<template>
  <div>
    <div v-if="elementsData == false">
      <p>LOADING DATA HERE</p>
    </div>
    <section class="periodic-table" v-if="elementsData">
      <div class="element-outer" v-for="elementObject in elementsData" v-bind:key="elementObject.name">
        <slot :propElementObject="elementObject"></slot>
      </div>
    </section>
  </div>

</template>

<script>
export default {
  name: "PeriodicTable",
  data() {
    return {
      host: "http://localhost:3000/",
      elementsData: []
    };
  },
  methods: {
    fetchElementData() {
      fetch(this.host + "data")
        .then(response => {
          return response.json();
        })
        .then(myJson => {
          this.elementsData = myJson;
        });
    }
  },
  created() {
    this.fetchElementData();
  }
};
</script>

<style scoped lang="scss">
.periodic-table {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr;
}

.element-outer {
  margin: 10px;
}
</style>
