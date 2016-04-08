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
    
      After render. Good to ccess Dom, integrate framework, set timers, AJAX requests
    
    - componentWillReceiveProps
    
      When receiving new props. Not called on initial render. Good to set state before a render
    
    - shouldComponentUpdate
    
      Before render when new props or state are being received. Not called on initial render. Good to performance(Return false to void unnecessary re-renders)
    
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



##Tools
+ Browserify  (Bundler)
   Use Node modules in the browser.
   
+ Gulp  (Build)
   Task runner
   

