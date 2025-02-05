

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

## ref
+ [](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)