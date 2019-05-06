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
 
 + private
 
        class Car{
            private _engine:string;
            
            constructor(engine:string)
            {
                this._engine=engine;
            }
        }

+ public 
      
        //automatically generate the field
        class Car{
            constructor(public engine:string){}
        }
        
+ get/set
     
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
   
+ function

        class Car{
            
            start():void{
                
            }
        }  
   
+ Casting
 
        //convert htmlelement to HTMLTableElement
        var table:HTMLTableElement=<HTMLTableElement>document.createElement('table');
        //casting interface to a instance
        var _engine=<Engine>myengine;
    
+ interface

        interface IEngine{
            start(callback:(startStatus:boolean,engineType:string)=>void):void;
        }

        interface IAutoOPtions{
            engine:IEngine;
            state:string;
        }

        //implement interface

        class TestClass implements ITest{
            private a=2;
            public b=4;
        }


 + Extending Types

        class ChildClass extends parentClass{
            constructor(){
                super();
            }
            
            addAccessories(...accessory:Accessory[]){
                
            }
        }
 
 ###Modules
 
 + Internal Modules   [Don't use](https://www.stevefenton.co.uk/2015/05/stop-mixing-typescript-internal-and-external-modules/)
 
   default is global module. Must sequence script tags properly.
 
 
        //define module
        //sample.js
        namespace Shapes{
            
            export class Rectangle{}
            
        }
        //use module
        //app.js
        ///<reference path="./sample.js";>
        var rect=new Shapes.Rectangle();
 
 + External Modules  
   CommonJS/AMD
        //define module
        //sample.js
        export class DataService {...}
        
        //use module
        //app.js
        import sa=require('./sample.js');
        
 + use 3rd lib
 
        ///<reference path="../typings/jquery.d.ts";>
        declare var $:JQueryStatic


##Typings reference   

[Module Resolution](https://www.typescriptlang.org/docs/handbook/module-resolution.html)

+ add reference in ts file

`/// <reference path="../interfaces/interfaces.d.ts"/>`


##Typings management tools
+ [TSD](http://definitelytyped.org)
+ [typings](https://github.com/typings/typings)


##Ref
 + [typescriptlang](http://www.typescriptlang.org/docs/tutorial.html)
 + [git typescript](https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md)