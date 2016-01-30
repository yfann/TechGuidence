##Build for iOS [#](http://taco.visualstudio.com/en-us/docs/ios-guide/)

###Packaging [#](http://taco.visualstudio.com/en-us/docs/tutorial-package-publish-readme/)

 Only select Local Device(iphone connected to windows with iTunes) or Remote Device(iphone connected to Mac) IPA is possible.

1. add device to device list in developer center

2. generate provisioning profiles

3. log apple id(developer account) in XCode

4. set Package Name in config.xml of cordova
 
###debug on device [#](http://phonegap-tips.com/articles/debugging-ios-phonegap-apps-with-safaris-web-inspector.html)


1. setting -> safari -> advance -> web Inspector(ON) (iphone)
2. setting -> safari -> Private Browsing(OFF) (iphone)
3. connect iphone to MAC
4. safari -> preferences -> advanced -> show Develop menu in menu bar(checked)(MAC)
5. open app(iphone)
6. debug app safari -> select develop menu item -> iphone (MAC)
7. use console.og() to locate the issue

###Troubleshooting

+ Command failed with exit code ENOENT
   
   the Cordova CLI is lower than 4.3, update it [#](http://taco.visualstudio.com/en-us/docs/change-cli-version/#how-to-update-the-cli-version-of-your-project)
   change CLI version and rebuild 
   
+ The edge module has not been pre-compiled for node.js ... [#](https://github.com/tjanczuk/edge/issues/331)
    
  I fixed that problem going to the folder C:\Users\{user}\AppData\Roaming\npm\node_modules\vs-tac and changing the package.json to use edge version 4.0.0, deleting the edge folder in the node_modules, and running npm install in the vs-tac folder
    
+ No provisiong profiles found
  
   Apps can run on the simulator without a profile, but they are required to run on an actual device. The project in Xcode automatically has one. For others need:
   
+ SyntaxError: Unexpected token C (Build fail)

   remove  remote_ios.json under plugins folder
   
+ path case sensitive in iphone