<template>
    <div class="graphic-outer" :style="[...currentTheme.atomGraphic]">
        <div class="graphic">
            <div class="graphic-inner">
                <p>{{ selectedAtom.atomicNumber }}</p>
                <p>{{ selectedAtom.abbreviation }}</p>
                <p>{{ selectedAtom.name }}</p>
                <p>{{ selectedAtom.atomicWeight }}</p>
            </div>
        </div>
    </div>
</template>

<script>
import { mapState } from "vuex";

export default {
    name: "AtomGraphic",
    computed: {
        ...mapState("themes/", ["currentTheme"]),
        ...mapState("atomData/", ["selectedAtom"])
    }
};
</script>

<style scoped>
.graphic-outer {
    border-radius: 5px;
}

.graphic {
    position: relative;
    height: 0;
    width: 100%;
    padding-bottom: 100%;
}

.graphic-inner {
    height: 100%;
    width: 100%;
    position: absolute;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
</style>

<style scoped>
.graphic-outer {
    background-color: var(--background-color);
    border: 1px solid var(--border);
    box-shadow: 2px 2px 4px var(--box-shadow);
    color: var(--color);
}

.graphic-outer:hover {
    box-shadow: 2px 2px 4px var(--box-shadow_hover);
}
</style>
