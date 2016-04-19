#Git

###git init

###git clone <repository>

###git add *

###git status

###git commit -m "commit"

###git push/pull origin master   //1.pull resolve confliction 2.push to remote(has no conflict)

###git remote add origin <server>

###git checkout/merge/delete   //branch

###git branch

###

类似svn的check out 

执行的操作：

1. 创建新目录并git init
2. git remote add origin <repository>
3. git fetch
4. git checkout

###Work Flow

(git clone or git init)->  Working dir   
(add to)->  Stage   
(commit to)->  HEAD  
(git push)-> Remote Repository

git之间都是独立的仓库，pull/push用于仓库间协作

![](https://github.com/yfann/TechGuidence/blob/master/img/git01.png?raw=true)

###Tools

+ gitolite //permission for login
+ gerrit //
+ Git Bash //