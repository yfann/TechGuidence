# Git

## CMD

3. git clone <repository>

4. git add *

5. git commit -m "commit"

6. git pull origin master   //pull resolve confliction

7. git push origin master //push to remote(has no conflict)

7. git branch/checkout/merge/delete   //branch

## Basic CMD

checkout 移动的是 Head, reset 移动的是 Head 指向的分支

+ `git init --bare my-project.git`  一般用来创建中央仓库，工作环境用clone获取,中央仓库为bare,工作仓库为none-bare
+ `git add <filename>/*/-p`  -p交互模式
+ `git commit -m "comments"`
+ `git push origin master`
+ `git remote add origin <server>`
+ `git clone <repo>`
+ `git commit -a` 相当于先git add, 然后git commit
***
+ `git status` 查看working dir 和stage
+ `git log` 查看committed history
+ `git log -n 3` 显示3个提交
+ `git log --oneline` 每个提交压缩到一行
***
+ `git checkout <file>` 把文件从stage中复制到working dir;把一个文件恢复到最近提交的状态
+ `git checkout <commit> <file>` 从历史版本中取出文件放入stage和working dir中
+ `git checkout <commit>` HEAD指向所选分支，stage和working dir和分支内容一致。只存在于老分支的内容会被删除，无关的文件会被忽略不受影响。
+ `git checkout -b <name>` 为HEAD的指向创建一个分支
+ `git checkout HEAD <file>` 找出文件的最近版本,回滚到最后一次提交，HEAD~(HEAD的父节点)
***
+ `git revert <commit>` 撤销一个commited,不改变历史项目，增量修改
+ `git revert HEAD` 撤销刚刚的提交，改变working dir
***
+ `git reset <file>` 从stage中移除文件或用commited中的文件更新srage中的文件，不影响working dir
+ `git reset` 清空stage（文件stage--->unstage)
+ `git reset --hard` 清空stage(文件stage---->unstage(changed---->unchange)),不影响未在stage中的文件;(先删除working dir中的所有文件，再使用此命令会还原working dir;或者使用后配合`git clean -d -x -f`)
+ `git reset <commit>` !!!!!!
+ `git reset --hard <commit>`
***
+ `git clean -n` 显示删除那些未被追踪的文件(没有被staged/git add的文件)
+ `git clean -f ` 删除当前目录下未被追踪的文件
+ `git clean -f <path>`
+ `git clean -df` 移除文件以及目录
+ `git clean -xf` 包括gitignore中指定的文件
+ `git clean -d -x -n` 查看要删除的文件及目录
+ `git clean -d -x -f` 删除
***
+ `ssh git-server` test connection after put public key in c:\users\your name\.ssh 
+ `git config --system core.longpaths true`   fix File name too long issue


## Branch

+ `git branch -a` 查看所有分支
+ `git branch [branchName]` 创建分支
+ `git branch -d/-D [branchName]` 删除分支
+ `git branch -m [branchName]` 当前分支改名
+ `git checkout [branchName]` 切换分支, `git checkout master`
+ `git push origin [branchName]` 本地创建分支后，把分支推送到远程仓库
+ `git pull origin [branchName]` 更新分支(或者`git checkout [branchName]`,`git pull`),第一次拉仓库时会包含所有分支
+ `git merge [branchName]` 指定分支并入当前分支

## 命令组合

+ git reset --hard
+ git clean

## Config

+ `cat .git/config` 查看origin信息
+ `git config [--global] --list` 查看配置
+ `git config [--global] user.name '...'` user.email
+ `git config --global --unset user.password`

***

## Work Flow

git之间都是独立的仓库，pull/push用于仓库间协作

![](https://github.com/yfann/TechGuidence/blob/master/img/git01.png?raw=true)

Working dir---(add)---->Index(Stage)-----(commit)--->Head/History

## Tools

+ gitolite //permission for login
+ gerrit 
+ Git Bash 
+ gitextension


## issue

+ git merge

```
press "i"
write your merge message
press "esc"
write ":wq"
then press enter
```

## Ref

+ [git config](http://www.cnblogs.com/wanqieddy/archive/2012/08/03/2621027.html)
+ [guidence](https://github.com/geeeeeeeeek/git-recipes/wiki)
+ [csdn](http://blog.csdn.net/codectq/article/details/50777934)
+ [revert merge](http://blog.csdn.net/hongchangfirst/article/details/49472913)
