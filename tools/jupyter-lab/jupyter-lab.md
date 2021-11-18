

## cmd

+ `pip install jupyterlab`
    + `pip show jupyterlab`

## gopherdata

+ windows
    + `go get -u github.com/gopherdata/gophernotes`
    + `mkdir %APPDATA%\jupyter\kernels\gophernotes`
        + cmd
    + `copy %GOPATH%/pkg/mod/github.com/gopherdata/gophernotes@v0.7.3/kernel/ %APPDATA%\jupyter\kernels\gophernotes`
    + `jupyter --data-dir`
    + %APPDATA%\jupyter\kernels\gophernotes\kernel.json
    ```json
        {
            "argv": [
            "C:\\gopath\\bin\\gophernotes.exe",
            "{connection_file}"
            ],
            "display_name": "Go",
            "language": "go",
            "name": "go"
        }
    ```
    + `docker run -it -p 8888:8888 gopherdata/gophernotes`
    + `jupyter-lab`


## ref

+ [JupyterLab，极其强大的下一代notebook！](https://zhuanlan.zhihu.com/p/87403131)

+ [gophernotes](https://github.com/gopherdata/gophernotes)

+ [nbviewer](https://nbviewer.jupyter.org/)