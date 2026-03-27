# clone voice skill


## 提取音频
+ `ffmpeg -i peppa.mp4 -vn -acodec pcm_s16le -ar 44100 -ac 2 output.wav`

## 去背景音
```sh
# brew install ffmpeg
# python 3.11
# pip install numpy==1.26.4 torch==2.1.2 torchaudio==2.1.2 --force-reinstall
# pip install soundfile
python3 -m venv demucs-env
source demucs-env/bin/activate
pip install demucs
demucs output.wav

# demucs最稳定组合
# python = 3.10 / 3.11
# torch = 2.1.2
# torchaudio = 2.1.2
# numpy = 1.26.4
# demucs = 最新
```

## 自动提取人声
+ `conda create -n diarization-env python=3.10 -y`
+ `conda activate diarization-env`
+ `pip install pyannote.audio`
