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

###Apache Cordova

It is an opensource and simplest cross-platform framework. This technology is based on WebBiew(WebKit-based).It wraps up web applications in a native app shell and then implements them on native stores for different platforms.

Used by: Adobe PhoneGap, Oracle ADF Mobile, SAP Kapsel, IBM Worklight, Microsoft
Supports: iOS, Android, Windows, Blackberry, Firefox OS and others.

PROS:
+ Uses common web development technologies: JavaScript, HTML5 and CSS.
+ A single, standard API works across all device platforms.
+ 100 percent of code reuse is possible.
+ rich 3rd party plugins
CONS:
+ Too many fragmented libraries and frameworks at a very basic level
+ User interface of app varies depending on the quality of web view rendered
+ Performance doesn't come close to native apps

###Appcelerator Titanium
Titanium is a JavaScript-based development platform in that, it uses JavaScript to write application codes with native APIs and UI conventions of each platform. This means, it doesn’t try to accomplish the notion ‘write once and run anywhere’ but it attempts to write apps reusing JavaScript with platform-specific features and performance. Apps are written in JavaScript but must utilize custom XML and Appcelerator’s API. No HTML5 or CSS is used. It's more like a converter from web to native.

Used by: ebay, pwc, Cisco, VMware
Supports: iOS and Android

PROS:
+ The resulting UI look-and-feel is close to native.
+ 100 percent code reuse is possible
+ Compiled code is a combination of native and javascript, so performance is improved

CONS:
+ Only supports UI features that are common across all platforms
+ There is a small delay at app startup due to library loading
+ No suport for third-party libraries
+ Difficulty in developing complex apps
+ Since it doesn’t use HTML5 and CSS, the animations and DOM elements are laggy and less responsive

##Xamarin

This framework is based on mono. It works on C# within .NET framework and allows you to create native apps by utilizing native APIs and UIs of each platform.Xamarin comes with Xamarin.Forms library which allows you to write native UIs for once and then share and convert them to platform-specific UIs.

Used by: GitHub, Microsoft, Foursquare
Supports: Android,iOS and Windows.

PROS:
+ Compiled code is platform specific, so it can achieve hight performance, use native hardware acceleration, device features and native UI components.
+ c# is used to develop for all platforms supported.
+ From 60 to 100 percent code reuse is possible.

CONS:
+ Xamarin.Forms results in a lowest common denominator UI, but customization is possible.
+ Does not provide access  to certain ANdroid specific UI controls
+ Load times are slightly slower as the Xamarin runtime must be loaded at invocation.
+ Does not support sharing of codes ourside Xamarin environment for native or HTML5 development
+ Business level license is $999 per year

###React Native

React Native is a Facebook, and Instagram developed JavaScript library used in creating native mobile applications. This is the newly developed open source framework by Facebook, which permits someone to write iOS (this now also includes Android platform) applications using JSX, a known HTML look-a-like code, and JavaScript. This framework is created on the foundation of the React.js. You can use javascript and JSX to create a native mobile app.

Customers: FaceBook
Supports: iOS, Android

PROS:
+ Renders native views with a native behavior and interaction
+ Developers only need React and javascript to create better application for Andoroid,iOS
+ Uses native architecture and concept
+ It does not require a WebView

CONS:
+ Code abstraction leads to bugs and memory leaks
+ Canot work without the API, which is provided by React Native
+ It's still a new framwwork so we can't predict possible problems and downsides
+ It's not a write-once-run-anywhere framework. Code writen for iOS will not work for Android.
+ Some specific components will not have available implementation so you'll need to write them on your own.
+ When crearing proper native app, a developer will ahve more power and control regarding performance tuning.


In reality there is no perfect mobile framework for developing. Each of the cross-development platforms above have their individual strengths and weaknesses. We should choose the one that meets the requirements and purpose of our solution. None of these are a wrong choice, however, one might be better than the other depending on our requirements. Also need to consider the balance between  cost and  performance. Currently we decide to use Cordova to write some mobile app demos. Becuase Cordova is basically pure web techonology which we are very familiar with.(We are also familiar with c# but Xamarin is not free.) The learning curve is shortter than other frameworks. We can rapidly use it to develop some demo apps. 

Cordova is a underlying framwork for packaging web pages to mobile app. So there are some UI frameworks like Sencha Touch, JQuery Mobile, Ionic, Kendo UI  using cooperatively with Cordova. Among them Ionic is more suitable to the team. Ionic is based on cordova and angularjs and has rich native-styled mobile UI elements and layouts. 