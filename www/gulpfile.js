const gulp = require('gulp');
const concat = require('gulp-concat');
const uglify = require('gulp-uglify');
const cssmin = require('gulp-cssmin');
const concatCss = require('gulp-concat-css');

gulp.task('css:app', function () {
    return gulp.src('css/app/**/*.css')
        .pipe(concatCss('styles.min.css'))
        .pipe(cssmin())
        .pipe(gulp.dest('dist/'))
});

gulp.task('css:vendor', function () {
    return gulp.src('css/lib/**/*.css')
        .pipe(concatCss('vendors.min.css'))
        .pipe(cssmin())
        .pipe(gulp.dest('dist/'))
});

gulp.task('js:app', function () {
    return gulp.src([
        'js/app/**/*.js'
    ])
        .pipe(concat('app.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('dist/'));
});


gulp.task('js:vendor', function () {
    return gulp.src([
        'js/lib/angular.min.js',
        'js/lib/**/*.js'
    ])
        .pipe(concat('vendors.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('dist/'));
});


gulp.task('build:prod', ['css:app', 'css:vendor', 'js:app', 'js:vendor']);

gulp.task('watch:app', function () {
    gulp.watch('css/app/**/*.css', ['css:app']);
    gulp.watch('js/app/**/*.js', ['js:app']);
});