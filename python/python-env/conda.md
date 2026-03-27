# Conda
+ “给每个项目一个独立运行环境” 
+ “帮你装好依赖”


## cmd
+ `conda create -n <name> python=3.10`
    + `conda activate <name>`
    + `conda deactivate`
+ `conda env list`
+ `conda list`
+ `conda remove -n myenv --all`


## AI项目依赖链
+ pip管不了底层依赖，Conda可以
```md
Python
 ↓
PyTorch
 ↓
CUDA / Metal / CPU
 ↓
numpy
 ↓
系统库（ffmpeg / libsndfile）
```


## Miniforge
<!-- install -->
+ `bash Miniforge3-26.1.1-3-MacOSX-arm64.sh`
+ `conda init zsh`
+ `exec zsh`
+ `conda --version`
<!-- cmd -->
+ `conda create -n test python=3.10`
+ `conda activate test`


## ref
+ [miniforge](https://github.com/conda-forge/miniforge)