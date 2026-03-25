# demucs
+ 音频源分离（source separation）模型
    + 把一段“混在一起的声音”，拆成不同来源的独立音轨

## mac
+ env
```py
# demucs最稳定组合
# python = 3.10 / 3.11
# torch = 2.1.2
# torchaudio = 2.1.2
# numpy = 1.26.4
# demucs = 最新
```

## docker
+ 最省事
```sh
docker run -it --rm \
  -v $(pwd):/app \
  demucs/demucs \
  demucs /app/output.wav
```

## Conda
+ Conda会处理依赖
```sh
conda create -n demucs python=3.10
conda activate demucs

pip install demucs
```


## root cause
+ 每一层都有兼容问题
```md
demucs
 ↓
torchaudio
 ↓
PyTorch
 ↓
numpy
 ↓
系统库（ffmpeg / libsndfile）
```