#Gulp

javascript task runner, streamline process

##CMD

`Gulp [TaskName]`

##Gulp API

+ gulp.task
        //Dependency tasks(jscs,jshint) run in parallel, not in sequence,run before js task
        gulp.task('js',['jscs','jshint'],function(){
            return gulp.src('./src/**/*.js')
                    .pipe(concat('all.js'))
                    .pipe(uglify())
                    .pipe(gulp.dest('./build/'));
        })

+ gulp.src

        //[base] defines how much of the path to retian  
        //from ./src/app/admin/admin.js   
        //to ./build/app/admin/admin.js
        gulp.src('./src/**/*.js',{base:'./src/'})
            .pipe(gulp.dest('./build/'));

+ gulp.dest
+ gulp.watch

        gulp.watch('./src/**/*.less',function(event){
            console.log('watched event '+ event.type + ' for '+ event.path);
        })
+ pipe().on('error',function(error){...})
    
##Plugins
[gulpjs](http://gulpjs.com/plugins/)
[npmjs](https://www.npmjs.com/)

###Code Analysis

+ gulp-eslint
+ gulp-jshint
+ gulp-jscs

###CSS

+ gulp-less
+ gulp-autoprefixer

###HTML

+ wiredep   //inject from bower
+ gulp-inject //inject from application

###Common

+ gulp-util
+ gulp-print
+ gulp-if
+ yargs
+ gulp-load-plugins
+ del
+ gulp-plumber //Prevent pipe breaking caused by errors from gulp plugins, pipe works and show error message
+ gulp-nodemon //node server
+ browser-sync
+ gulp-task-listing
+ gulp-imagemin


