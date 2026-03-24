# LoRA(Low-Rank Adaptation of Large Language Models)

+ 8G显存 训练
+ 200M 存储
+ 和checkpoint一起使用，在某个方面微调
+ 属于参数高效微调（Parameter-Efficient Fine-Tuning，PEFT）技术中的一种
    + PEFT技术的整体思想是冻结AIGC大模型的大部分参数，再引入一小部分可训练的参数作为适配模块进行微调训练，以达到节省AIGC大模型微调时显存开销的目的
+ Stable Diffusion 是“模型本体”，LoRA 是“给模型打补丁的方法”
    + SD: 文本生图
    + LoRA: SD的基础上定制风格

## text to Image
+ Stable Diffusion
    + Latent Diffusion Model (LDM)
    + 适合
        + 训练 LoRA（比如人物、IP）
        + 做精细控制（姿势、构图）
        + 本地低成本运行
        + 搭建 AIGC pipeline
+ FLUX
    + Transformer + Flow Matching
    + 适合
        + 高质量出图（接近 Midjourney）
        + 少调参直接出效果
        + 复杂 prompt（多人物/叙事）


## tools
+ ComfyUI
    + 用于运行 Stable Diffusion / FLUX 等生成模型的“节点式（node-based）可视化工作流工具”
    + FLUX + LoRA + ControlNet

## ref
+ [Stable Diffusion Quick Kit 动手实践-在 SageMaker 中进行 LoRA fine tuning 及推理](https://aws.amazon.com/cn/blogs/china/lora-fine-tuning-and-reasoning-in-sagemaker/)
+ [LoRA从原理到实践](https://www.bilibili.com/video/BV1nL411B7XT/?spm_id_from=333.788&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [零基础入门“炼丹”](https://www.bilibili.com/video/BV1TK411v7Jw/?spm_id_from=333.999.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)
+ [60分钟速通LORA训练！](https://www.bilibili.com/video/BV16e411e7Zx/?spm_id_from=333.1007.tianma.1-1-1.click&vd_source=d3c0a53193a65728ad278e633b3790e5)

<!-- docs -->
+ [深入浅出完整解析LoRA（Low-Rank Adaptation）模型核心基础知识](https://zhuanlan.zhihu.com/p/639229126)