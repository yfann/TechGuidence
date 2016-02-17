#Meteor[#](https://www.meteor.com/tutorials/blaze/creating-an-app)

##start

+ cmd:meteor create <myProject>  //create new project

//cd <myProject>

+ cmd:meteor   //start meteor project
+ cmd:meteor mongo  //open database
+ cmd:meteor deploy my_app_name.meteor.com
+ cmd for mobile [#](https://www.meteor.com/tutorials/blaze/running-on-mobile)


##Concepts

###Template
        
		//define
		<template name="task">
		  <li>{{text}}</li>
		</template>
		
		//reference
		{{> task}}
		or
		Template.task.

+ template script:		
Meteor's Spacebars compiler[#](https://github.com/meteor/meteor/blob/devel/packages/spacebars/README.md)

+ helpers:      

		//pass data to template
		Template.body.helpers({
			tasks: [
			{ text: "This is task 1" },
			{ text: "This is task 2" },
			{ text: "This is task 3" }
			]
		});

###Collection      

Persistent data, be accessed from both the server and the client, automatically update view

		Tasks=new Mongo.Collection("tasks");

###Event
         //bind to view
         Template.body.events
		 //bind event to template
		 Template.templateName.events(...)


###Session

Session is a convenient place to store temporary UI state, and can be used in helpers just like a collection

		Session.set("name",value);
		
		Session.get("name");