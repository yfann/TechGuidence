# NPM

## Commands

+ npm init [-f]
  create package.json
 
+ `npm i <package@version> --save`  
  save dependencies to package.json
  
+ `npm i <package@version> --save-dev` 
  save devDependencies to package.json

+ npm install  
  install all dependencies in package.json
  
+ npm install --production
  install dependencies in package.json except devDependencies

+ `npm uninstall <package> --save`

+ `npm info <package> [version]` 查看发布的包

+ `npm list [-g] --depth 0`  查看安装的包，除去-g查看local

## config

+ npm config 
+ 配置文件路径：[nodejs]/node_modules/npm/npmrc
  - 文件中添加：registry=https://registry.npm.taobao.org/ (添加淘宝镜像)