var gulp = require('gulp'),
    tap = require('gulp-tap'),
    coffee = require('gulp-coffee'),
    sass = require('gulp-sass'),
	jsdoc = require('gulp-jsdoc'),
	browserify = require('browserify'),
	source = require('vinyl-source-stream'),
	reactify = require('reactify'),
	concat = require('gulp-concat');

gulp.task('default', ['watch']);

gulp.task('compile-coffee', function () {
    gulp.src('./assets/**/*.coffee')
    .pipe(coffee({ bare: true})).on('error', function (err) {
        console.log('Error compiling ' + err)
    })
    .pipe(tap(function (file) {
        console.log('Processing file: ' + file.path);
    }))
    .pipe(gulp.dest('./app'));
});

gulp.task('compile-sass', function () {
   gulp.src('./assets/**/*.scss')
   .pipe(sass())
   .pipe(gulp.dest('./app'));
});

gulp.task('compile-jsdocs', function () {
	gulp.src('./app/**/*.js')
	.pipe(jsdoc('./docs'));
});

gulp.task('browserify', function () {
	var bundler = browserify('./assets/public/js/main.js');
	bundler.transform(reactify);
	var stream = bundler.bundle();
	stream.pipe(source('main.js'))
	.pipe(gulp.dest('./app/public/js'));
});

gulp.task('watch', function () {
    gulp.watch('./assets/**/*.coffee', ['compile-coffee']);
    gulp.watch('./assets/**/*.scss', ['compile-sass']);
	gulp.watch('./app/**/*.js', ['compile-jsdocs']);
	gulp.watch('./assets/public/js/**/*.js', ['browserify']);
});