const gulp = require("gulp");
const fs = require("fs");
const path = require("path");
const del = require("del");
const outDir = "back/public/json";

// https://github.com/gulpjs/gulp/blob/master/docs/recipes/running-task-steps-per-folder.md
let getFolders = dir => fs.readdirSync(dir).filter(file => {
  return fs.statSync(path.join(dir, file)).isDirectory();
});

gulp.task("copyFrontToBack", done => {
  // Remove current files (except Mathematica files in JSON folder)
  del(["back/public/**/*", "!back/public/json", "!back/public/json/*"]);

  // Copy over the front dist directory
  gulp.src("front/dist/**/*")
    .pipe(gulp.dest(path.join("back", "public")));
  done();
});

gulp.task("copyWolfToBack", done => {
  let dirs = getFolders("wolf");

  // Why doesn't path.join seem to be effective
  dirs.map(folder => {
    console.log(path.join("wolf", folder + "/*.json"));
    return gulp.src("wolf/" + folder + "/*.json")
      .pipe(gulp.dest(outDir));
  });
  done();
});