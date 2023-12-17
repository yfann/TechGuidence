wifip () {
sudo networksetup -setautoproxystate Wi-Fi on
sudo networksetup -setautoproxyurl Wi-Fi <xxx.pac>
echo "Wifi Proxy on"
}

wifipoff () {
sudo networksetup -setautoproxystate Wi-Fi off
echo "Wifi Proxy off"
}

# whereproxy
proxy () {
  export HTTP_PROXY="<ip:port>"
  export HTTPS_PROXY="<ip:port>"
  export NO_PROXY=192.168.99.100,192.168.99.101,localhost,127.0.0.1
  echo "HTTP Proxy on"
}

proxycn (){
        export http_proxy="<ip:port>"
        export https_proxy="<ip:port>"
        export no_proxy=192.168.99.100,192.168.99.101,localhost,127.0.0.1
        echo "CN Proxy on"
}

# where noproxy
proxyoff () {
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}

git_path=~/.gitconfig

gitp(){
  sed -in "s/proxy/#proxy/g" $git_path
  sed -r -i -e  "s/[ #]*(proxy=http:\/\/165)/\1/g" $git_path
  echo "git proxy on"
}

gitp-v2(){
  sed -in "s/proxy/#proxy/g" $git_path
  sed -r -i -e  "s/[ #]*(proxy=http:\/\/127)/\1/g" $git_path
  echo "git proxy on"
}

gitpoff(){
  sed -in "s/proxy/#proxy/g" $git_path
  echo "gitproxy off"
}


getgit(){
  sed -n '1,$p'  $git_path
}

clhis(){
  rm -rf ~/Library/Application\Support/com.colliderli.iina/history.plist
  rm -rf ~/Library/Containers/com.apple.QuickTimePlayerX/Data/Library/Preferences/*
  defaults delete -g NSNavRecentPlaces
  echo "clear history"
}
alias bb='vi ~/.zshrc'
alias bbb='source ~/.zshrc'

# k8s
alias kf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kc='kubectl exec -it'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kk='kubectl config get-contexts'