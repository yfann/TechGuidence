## issues

+ `exec user process caused no such file or directory` docker image runs
    + `apt install dos2unix`
    + 把需要运行的sh文件转换格式`dos2unix *.sh` CRLF to LF
    + `find . -type f -print0 | xargs -0 dos2unix`
        + 项目目录中运行，转换所有windows文件为Linux文件
    + `find . -name "*.ini" -print0|  xargs -0 dos2unix`
    + vscode
        + `ctrl+p`: preferences: open settings
            + `"files.eol": "\n"`


+ shell permission denied
    + `sudo chmod +x xx.sh`
    + `ls -l xx.sh`
    + `./xx.sh`
