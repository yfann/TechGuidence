

## cmd
+ `git config --list`
+ `git remote -v`
+ `git remote set-url origin https://github.com/your-username/your-repo.git`


## token auth
+ generate token
    + github->setting->developer settings->personal access tokens
        + token
+ `git clone https://<username>:<token>@github.com/<username>/<repository>.git`
+ `git remote set-url origin https://<token>@github.com/yfann/TechGuidence`
    + update origin url
+ `git config --global credential.helper store`
    + `git config --global credential.helper cache`
    + 在终端保存token



## ssh
+ `ssh-keygen -t ed25519 -C "..@..."`
+ admin run powershell
    + `Set-Service ssh-agent -StartupType Automatic`
    + `Start-Service ssh-agent`
    + `ssh-add ~\.ssh\id_ed25519`
+ GitHub → Settings → SSH and GPG keys → New SSH key
    + 添加公钥
+ `ssh -T git@github.com`
+ 多个github账号时
    + .ssh/config
        ```config
        # 账号 A
        Host github-A
            HostName github.com
            User git
            IdentityFile ~/.ssh/yfann

        # 账号 B
        Host github-B
            HostName github.com
            User git
            IdentityFile ~/.ssh/id_ed25519
        ```
    + `git remote set-url origin git@github-A:<user name>/<repo>.git`

## tips
+ `git remote -v`
+ `git remote set-url origin git@github-A:<user name>/<repo>.git`

## ref
+ [](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)