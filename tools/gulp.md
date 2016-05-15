#Gulp

javascript task runner, vinyl pipelines process

Gulp中的流是object mode流，发送的是vinyl对象。常规流指的是Node.js中操作Strings和Buffers的流。  
Gulp使用了vinyl-fs

Vinyl object:
+ Stream

        fs.createReadStream('/usr/share/dict/words').on('data', function(chunk) {  
           console.log('Read %d bytes of data', chunk.length);
        });

+ Buffer(Default)

        gulp.src('/usr/share/dict/words').on('data', function(file) {  
        console.log('Read %d bytes of data', file.contents.length);
        });
        
        //禁用buffer     
        gulp.src('/usr/share/dict/words', {buffer: false}).on('data', function(file) {  
          var stream = file.contents;
          stream.on('data', function(chunk) {
            console.log('Read %d bytes of data', chunk.length);
          });
        });       

+ null





##CMD

`Gulp [TaskName]`

##[Task Dependency](https://github.com/gulpjs/gulp/blob/master/docs/recipes/running-tasks-in-series.md)

By default tasks run with maximum concurrency. Dependency means it depends on completion of other tasks. This can decide the task sequence.

        //'return' is necessary to notify other tasks it's complete
        gulp.task('clean', function() {
             return del(['output']);
        });

        gulp.task('templates', ['clean'], function() {
        ....
        });

        gulp.task('styles', ['clean'], function() {
        ....
        });

        gulp.task('build', ['templates', 'styles']);

        // templates and styles will be processed in parallel.
        // clean will be guaranteed to complete before either start.
        // clean will not be run twice, even though it is called as a dependency twice.

        gulp.task('default', ['build']);

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

###Stream buffer

+ `vinyl-source-stream` 常规流(StringStream,FileStream)转换为Stream(vinyl对象)  
 
+ `vinyl-buffer` stream(vinyl对象)转换为Buffer(vinyl对象)   

                //有些插件只依赖buffer:gulp-uglify,gulp-traceur
                var source = require('vinyl-source-stream');  
                var buffer = require('gulp-buffer');  
                var uglify = require('gulp-uglify');

                fs.createReadStream('./src/app.js')  
                .pipe(source('app.min.js')) // 常规流转换成 vinyl stream
                .pipe(buffer())  //vinyl stream to vinyl buffer
                .pipe(uglify())
                .pipe(gulp.dest('dist/'));

+ `gulp-streamify`  让只支持buffer(vinyl对象)的插件可以直接处理Stream(vinyl对象) 

                var wrap = require('gulp-wrap');  
                var streamify = require('gulp-streamify');  
                var uglify = require('gulp-uglify');  
                var gzip = require('gulp-gzip');

                gulp.src('app.js', {buffer: false})  
                .pipe(wrap('(function(){<%= contents %>}());'))
                .pipe(streamify(uglify()))
                .pipe(gulp.dest('build'))
                .pipe(gzip())
                .pipe(gulp.dest('build'));


###Common

+ gulp-util
+ gulp-print
+ gulp-if
+ yargs
+ gulp-load-plugins
+ del
+ `gulp-plumber` Prevent pipe breaking caused by errors from gulp plugins, pipe works and show error message
+ `gulp-nodemon` node server
+ browser-sync
+ gulp-task-listing
+ gulp-imagemin
+ `gulp-uglify`  Minify files
+ `gulp-concat` Concatenates files
+ `gulp-marked` Convert markdown to html with marked
+ `gulp-swig` Compile to HTML
+ `merge2` Merge multiple streams, so this task is finished then other streams are done.
+ `gulp-sourcemaps`



