# stable dissusion
+ 出图效果=prompts+模型+参数


## install
<!-- mac -->
+ git clone https://github.com/apple/ml-stable-diffusion
+ pip install -e .
+ huggingface-cli login
    + huggingface token


## install stable-diffusion-webui on MAC
+ install conda
+ `conda create -y -n py38 python=3.8 && conda activate py38`
+ `git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git`
+ `cd stable-diffusion-webui`
+ `bash webui.sh`
    + http://127.0.0.1:7860/





## 参数
+ steps
    + 一般20左右
+ CFG Scale
    + 7~12

## tips
+ 低分辨率先绘制，然后高清修复
    + 图生图


## ref
+ [stable diffusion](https://github.com/CompVis/stable-diffusion)
<!-- online -->
+ [dreamstudio](https://beta.dreamstudio.ai/generate)
+ google colab
    + 云端juPyter
    + 免费GPU


<!-- 模型 -->
+ [huggingface](https://huggingface.co/login?next=%2Fsettings%2Ftokens)
+ [huggingface samples](https://github.com/huggingface/diffusers)
+ [dreambooth](https://huggingface.co/sd-dreambooth-library)


<!-- install -->
+ [Stable diffusion安装踩坑(win&Mac&iOS)](https://blog.csdn.net/weixin_45569617/article/details/126873709)

<!-- 教程 -->
+ [B站第一套系统的AI绘画课！零基础学会Stable Diffusion，这绝对是你看过的最容易上手的AI绘画教程 | SD WebUI 保姆级攻略](https://www.bilibili.com/video/BV1As4y127HW/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)