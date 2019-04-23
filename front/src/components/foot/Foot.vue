<template>
  <div class="foot" :style="[...currentTheme.footer]">
    <p>© 2019 Edwin Kofler</p>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "Foot",
  computed: {
    ...mapState("themes/", ["currentTheme"])
  }
};
</script>

<style scoped>
.foot {
  display: flex;
  justify-content: center;
  padding: 2px 0;
  overflow: hidden;
}
</style>

<style scoped>
.foot {
  color: var(--color);
}
</style>
