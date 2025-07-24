# git 回滚

<!-- 创建分支 -->
+ git checkout main
+ git pull origin main
+ git checkout -b revert-to-version

<!-- 找到要回滚到的目标commit ID -->
+ git log --oneline

<!-- 创建revert commit回滚到指定版本 -->
+ git revert xyz789..abc123 --no-edit
    + 撤销的内容包括(xyz789, abc123]
    + xyz789^..abc123
        + 撤销包括xyz789

<!-- 推送分支并创建PR -->
+ git push origin revert-to-version