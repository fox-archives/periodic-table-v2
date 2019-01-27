<template>
  <div class="graphic-outer">
    <div class="graphic">
      <div class="graphic-inner">
        <p>Content</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ElementGraphic"
};
</script>

<style scoped>
.graphic-outer {
  margin: 5px;
}
.graphic {
  position: relative;
  height: 0;
  width: 100%;
  padding-bottom: 100%;
  background-color: lightblue;
}
.graphic-inner {
  height: 100%;
  width: 100%;
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
