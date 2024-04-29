# NPM

## Commands

+ npm init [-f]
  create package.json
 
+ `npm i <package@version> --save`  
  save dependencies to package.json
  
+ `npm i <package@version> --save-dev` 
  save devDependencies to package.json

+ `npm install`  
    + install all dependencies in package.json
    + `sudo npm install`
  
+ `npm install --production`
  install dependencies in package.json except devDependencies

+ `npm uninstall <package> [-g] [--save]`
+ `npm info <package> [version]` 查看发布的包
+ `npm list [-g] --depth 0`  查看安装的包，除去-g查看local
+ `npm view <package> versions`

<!-- npm update -->
+ `npm install npm -g`
+ `npm -v`
<!-- repo -->
+ `npm config set registry http://mirrors.cloud.tencent.com/npm/`
+ `npm config set registry https://registry.npmmirror.com`
+ `npm config set registry https://mirrors.huaweicloud.com/repository/npm/`
+ `npm config set registry https://registry.npmjs.org/`
  + 默认源
+ `npm config get registry`
<!-- cnmp -->
+ `npm install -g cnpm --registry=https://registry.npmmirror.com`
+ `cnpm install xxx`

## config

+ npm config 
+ 配置文件路径：[nodejs]/node_modules/npm/npmrc
  - 文件中添加：registry=https://registry.npm.taobao.org/ (添加淘宝镜像)



## npm proxy
+ `npm config get proxy`
+ `npm config delete proxy`
+ `npm config delete https-proxy`
+ `npm config set proxy http://xxxx:xx`
+ `npm config set https-proxy http://xxxx:xx`


## install
+ `npm install cfonts -g`