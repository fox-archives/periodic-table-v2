const gulp = require("gulp");
const fs = require("fs");
const path = require("path");
const outDir = "back/public/json";

// https://github.com/gulpjs/gulp/blob/master/docs/recipes/running-task-steps-per-folder.md
let getFolders = dir => fs.readdirSync(dir).filter(file => {
  return fs.statSync(path.join(dir, file)).isDirectory()
});

gulp.task("move-wolf-json", done => {
  let dirs = getFolders("wolf");

  // Why doesn't path.join seem to be effective
  dirs.map(folder => {
    console.log(path.join("wolf", folder + "/*.json"));
    return gulp.src("wolf/" + folder + "/*.json")
      .pipe(gulp.dest(outDir));
  });
  done();
});