#[TypeScript](https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md)
##install

    npm install -g typescript
    
    
##[VS Code editing TS](https://code.visualstudio.com/Docs/languages/typescript)

###[tsconfig.json](http://www.typescriptlang.org/docs/handbook/tsconfig.json.html)

通过定义 tsconfig.json  创建TypeScript project.

+ [compilerOptions](http://www.typescriptlang.org/docs/handbook/compiler-options.html)
+ files   //编译所有files中指定的*.ts和*.tsx 
+ exclude
+ compileOnSave
+ outDir   //location of built code
+ rootDir //location of source code?
+ watch //trigger recompiliation on changes
+ out //built to a single file
+ jsx //preserve(tsx to jsx) or react(tsx to js)

###tasks.json

F1 + Configure Task runner


##语法 
###Ambient Declarations

        declare var document;//defined in browser
        
###Function Types

        function vote(candidate: string, callback: (result: string) => any) {  
        // ...  
        }

        vote("BigPig",  
            function(result: string) {  
                if (result === "BigPig") {  
                    // ...  
                }  
            }  
        );
 
 ###Object Types
 
 
 ##[TSD](http://definitelytyped.org/tsd/)
 
 ##Ref
 
 + [typescriptlang](http://www.typescriptlang.org/docs/tutorial.html)
 + [git typescript](https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md)