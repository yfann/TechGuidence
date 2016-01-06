#mobile app development

##mobile app technologys

###Native Apps
  
 + Description: Use specific programing language to develop app for one specific platform. Like using objective-C for IOS, java for Android. This kind of app is installed from app store.
  
 + Strengths: Can take full advantage of all the device features. They can use the camera, the GPS, the accelerometer, the compass, the list of contacts and so on. They can also incorporate gestures. 
  And native apps can use the device's notification system and can work offline. And it has the best performance and user experience.
  
 + Weaknesses: One specific programing language can only support one specific platform. It's not cross-platform. It may take highter cost for supporting multipule platform.
  
###Web Apps

 + Description: Web apps are mobile-optimized webpages that look like an app. They are really websites. They are ran by a browser and typically written in HTML5.
  
 + Strengths: Rapid deployment(skip app store auditing),cross-platform
  
 + Weaknesses: Native features are inaccessible in the browser. The notifications, running in the ebackground, accelerometer information, complex gestures.
  

###Hybrid Apps

 + Description: Hybrid apps are part native apps, part web apps. It's installed from app store.
  
 + Strengths: Cross-platform development and reduce development costs. Can take advantage of the many device features available.Rapid deployment(skip app store auditing)
  
 + Weaknesses: Performance is not good as native apps.
  
##How to choose

There are several aspects need to be considered when developing mobile apps.

+ Device features. Only native apps (and the native components of the hybrid apps) have access to the full paraphernalia of device-specific features, including GPS, camera, gestures, and notifications.

+ Speed. Native apps have the best performance. 

+ Maintenance. Maintaining a native app is more complicated than maintaining a web app or a hybrid app. Because changes have to be packaged in a new version and placed in the app store for a native app. But maintaining a web app or a hybrid app is as simple as maintaining a web page, and it can be done as often or as frequently as needed.

+ Platform independence. If platform independence is important, you definitely have a better chance of achieving it with web apps and hybrid apps than with native apps. At least parts of the code can be reused when creating hybrid or web apps.

+ Content restrictions, approval process, and fees. Dealing with a third party that imposes rules on your content and design can be taxing both in terms of time and money. Native and hybrid apps must pass approval processes and content restrictions imposed by app stores, whereas the web is free for all. And buying a subscription within an iOS app means that 30% of that subscription cost goes to Apple, a big dent in the publishers’ budget.

+ Development cost. It’s arguably cheaper to develop hybrid and web apps, as these require skills that build up on previous experience with the web. Developing native is a lot more expensive, especially for different platforms, as it requires specific programming language for specific platform. 

+ User Interface. If one of your priorities is providing a user experience that is consistent with the operating system and with the majority of the other apps available on that platform, then native apps are the way to go. That doesn’t mean that you cannot provide a good user experience with a web app or a hybrid app, it just means that the graphics and the visuals will not be exactly the same as those with which users may be already accustomed.


Considering device features, maintenance, platform independence, content restrictions, development cost, I think hybrid app is more suitable for our phoenix project. Developing hybrid app is faster than native app. This can help reducing the risk of project delay and seizing the market earlier. Above all our team already knowing the technologys required for hybrid app. We can still use html5, angularjs, css3 to develop hybrid app with former experiences.


##hybrid frameworks

###Cordova

Customers: Adobe, Microsoft, IBM

###Ionic

It's based on cordova and angularjs including beautiful UI components

##Other Cross-Platform framework

##Appcelerator Titanium

This framework use javascript to develop native and native/web apps for differnet platforms.

Customers: ebay, pwc, PayPal

##Reactive Native

Customers: FaceBook

##Xamarin

This framework is based on mono. Use c# to develop native apps for different platforms.