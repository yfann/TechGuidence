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

***

##语法 
###Ambient Declarations

        declare var document;//defined in lib.d.ts
        
 ###Types
 
 + any (compiler don't check static type)
 + number
 + boolean
 + string/string[]
 + Object
 + Function
 + null (null type is a subtype of all primitives)
 + undefined (underfined is a subtype of all types)
 
        //convert other type to bool
        !!'string' (true)
        
        //? means option
        var a=function(react:{h:number;w?:number;}){}
        
        //arrow functions
        var greetMe:(msg:string)=>void;
        
        var squareIt:(rect:{h:number;w?:number;})=>number;
        
        interface SquareFunction{
            (x:number):number;
        }
        var squareItBasic:SquareFunction=(num)=>num*num;
        
        interface Person{
            name:string;
            age?:number;
            calcPets:()=>number;
        }
        var p:Person;
 
 
 
 ###Classes&interfaces
 
 class member are public by default
 
        Class Car{
            engine:string;
            
            constructor(engine:string)
            {
                this.engine=engine;
            }
        }
        
        //automatically generate the field
        class Car{
            constructor(public engine:string){}
        }
        
        //define property
        class Car{
            private _engine:string;
            
            constructor(engine:string){
                this.engine=engine;
            }
            
            get engine():string{
                return this._engine;
            }
            
            set engine(value:string){
                this._engine=value;
            }
        }
        
        var car=new Car('test');
        
 ##[TSD](http://definitelytyped.org/tsd/V)
 
 ##Ref
 
 + [typescriptlang](http://www.typescriptlang.org/docs/tutorial.html)
 + [git typescript](https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md)