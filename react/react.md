#React

+ HTML should be a projection of app state, not a source of truth.

+ JavaScript and HTML belong in the same file.

+ Unidirectional flow.

+ Inline styles can be good.

##Concepts

+ Props&State

    this.props.username //immutable
    this.state.username //mutable

+ lifecycle methods
    - componentWillMount  
      
      Before initial render,both client and server. Good spot to set initial state
      
    - componentDidMount
    
      After render.(only client side)Good to ccess Dom, integrate framework, set timers, AJAX requests
    
    - componentWillReceiveProps
    
      When receiving new props(props的改变会触发). Not called on initial render. Good to set state before a render
    
    - shouldComponentUpdate
    
      Before render when new props or state are being received(state,props的改变会触发). Not called on initial render. Good to performance(Return false to void unnecessary re-renders)
    
    - componentWillUpdate
     
      Immediately before rendering when new props or state are being received. Not called on initial render. Good to prepare for an update
    
    - componentDidUpdate
    
      After component's updates are flushed to the DOM. Not called for the ninitial render. Good to work with the DOM after an update.
    
    - componentWillUnmount
    
      Immediately before component is removed from the DOM. Good to cleanup resources

+ keys for Dynamic Children

        <tr key={p.name}>

+ Controller Views

    - Top level component
    - Sets props on Children
    - Interacts with stores

+ Prop Validation  
   doen't run on production(minified version).

        React.PropTypes.object.isRequired
        React.PropTypes.func.isRequired

+ Mixins  
  For cross-cutting concerns, share code between multiple components, share behavior among multiple components
  
        var ManageAuthorPage=React.createClass({
            mixins:[
                Router.Navigation,
                Router.State,
            ],
            ...
        })


##React Router

+ Route

        <route path="/course/:courseId" handler={Course}/>

        //and a URL like this
        '/course/clean-code?module=3'

        var Course=React.createClass({
            render:function(){
                this.props.params.courseId; //"clean-code"
                this.props.query.module;//"3"
                this.props.path;//"/course/clean-code/?module=3"
            }
        });

+ Links

        URL:/user/1

        Route:<route name="user" path="/user/:userId"/>

        JSX:<Link to="user" params={{userId:1}}>Bobby Tables</Link>-----><a href="/user/1">Bobby Tables</a>
        
+ Handling Transitions

        var Settings=React.createClass({
            statics:{
                willTransitionTo:function(transition,params,query,callback){
                    if(!isLoggedIn){
                        transition.abort();
                        callback();
                    }
                },
                willTransitionFrom:function(transition,component){
                    if(component.formHasUnsavedData()){
                        if(!confirm('Sure you want to leave without saving?')){
                            transition.abort();
                        }
                    }
                }
            }
            //...
        });

+ Hash vs. History URLs

    - Hash Location: yourUrl.com#/courses   
      all browsers

    - History Location:yourUrl.com/courses   
      IE10+   
      Works for server-render

##Flux  
A pattern, Centralized dispatcher, Unidirectional data flows, deal actions and data changes

Two-way binding: Viewmodel------->View,View----------------->Viewmodel   

Unidrectional: Action----------->Dispatcher--------->Store------------->React View---------------->Action

+ Action  
+ Dispatcher   
  Centralized callback,Broadcasts payload to registered callbacks, send payload to many stores. Allow stores updated by order.  
  Singleton  
+ Store   
  Hold app state, logic, data retrieval. Not a model-Contains models. Registers callbacks with dispatcher.
  include:
  - Extend EventEmitter
  - addChangeListener and removeChangeListener
  - emitChange

##Components

+ Container component
+ UI component
+ Sateless component



##Tools
+ Browserify/webpack
   

