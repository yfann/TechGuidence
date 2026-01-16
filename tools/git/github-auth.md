

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

## ref
+ [](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)