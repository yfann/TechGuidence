#NPM

##Commands

+ npm init [-f]
  create package.json
 
+ npm i [xxx] --save  
  save dependencies to package.json
  
+ npm i [xxx] --save-dev 
  save devDependencies to package.json

+ npm install  
  install all dependencies in package.json
  
+ npm install --production
  install dependencies in package.json except devDependencies

+ `npm info <package> [version]` 查看发布的包

+ `npm list [-g] --depth 0`  查看安装的包，除去-g查看local