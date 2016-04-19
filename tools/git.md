#Git

##CMD

3. git clone <repository>

4. git add *

5. git commit -m "commit"

6. git push/pull origin master   //1.pull resolve confliction 2.push to remote(has no conflict)

7. git branch/checkout/merge/delete   //branch

###Basic CMD
+ `git init --bare my-project.git`  一般用来创建中央仓库，工作环境用clone获取,中央仓库为bare,工作仓库为none-bare
+ `git add <filename>/*/-p`  -p交互模式
+ `git commit -m "comments"`
+ `git push origin master`
+ `git remote add origin <server>`
+ `git clone <repo>`
+ `git commit -a` 相当于先git add, 然后git commit
+ `git status` 查看working dir 和stage
+ `git log` 查看committed history
+ `git log -n 3` 显示3个提交
+ `git log --oneline` 每个提交压缩到一行

+ `git checkout <commit>` 切换分支，`<commit>`为如master,git log中的历史版本，使working dir为分支状态
+ `git checkout <commit> <file>`
+ `git checkout HEAD <file>` 找出文件的最近版本

+ `git revert <commit>` 撤销一个commited

+ `git reset <file>` 从stage中移除文件，不影响working dir
+ `git reset` 清空stage
+ `git reset --hard` 清空stage和working dir中的更改
+ `git reset <commit>` !!!!!!
+ `git reset --hard <commit>`


+ `git clean -n` 显示删除那些未被追踪的文件
+ `git clean -f ` 删除当前目录下未被追踪的文件
+ `git clean -f <path>`
+ `git clean -df` 移除文件以及目录
+ `git clean -xf` 包括gitignore中指定的文件


***

##Work Flow

git之间都是独立的仓库，pull/push用于仓库间协作

![](https://github.com/yfann/TechGuidence/blob/master/img/git01.png?raw=true)

Working dir---(add)---->Index(Stage)-----(commit)--->Head/History

###Tools

+ gitolite //permission for login
+ gerrit 
+ Git Bash 