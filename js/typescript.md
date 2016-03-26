#[TypeScript](https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md)

##[VS Code editing TS](https://code.visualstudio.com/Docs/languages/typescript)

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