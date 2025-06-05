# AI fundamentals
+ AI > Machine learning > Deep learning > Generative AI


## ML
+ Traning data -> ML algorithm -> Model

+ Training data
    + labeled/unlabeled data
    + structured data
        + tabular data
        + time-series data
    + unstructured data
        + text 
        + image

+ ML learning process 
    + supervised learning
        +  the algorithms are trained on labeled data. The goal is to learn a mapping function that can predict the output for new, unseen input data.
        + types
            + classification
            + regression
                + predicting continuous or numerical values based on one or more input variable
                + use cases
                    + Advertising popularity prediction
                    + Weather forecasting
                    + Market forecasting

    + unsupervised learning
        + refers to algorithms that learn from unlabeled data. The goal is to discover inherent patterns, structures, or relationships within the input data.
        + types
            + clustering
                + use c ases
                    + Customer segmentation
                    + Targeted marketing
            + Dimensionality reduction
                + use cases
                    + Big data visualization
                    + Meaningful compression
    + reinforcementg learning
        + the machine is given only a performance score as guidance and semi-supervised learning, where only a portion of training data is labeled. Feedback is provided in the form of rewards or penalties for its actions, and the machine learns from this feedback to improve its decision-making over time.
        + this one continuously improves its model by mining feedback from previous iterations

+ Inferencing
    + batch Inferencing
        + Batch inferencing is when the computer takes a large amount of data, such as images or text, and analyzes it all at once to provide a set of results. This type of inferencing is often used for tasks like data analysis, where the speed of the decision-making process is not as crucial as the accuracy of the results.
    + real-time Inferencing
        + Real-time inferencing is when the computer has to make decisions quickly, in response to new information as it comes in. This is important for applications where immediate decision-making is critical, such as in chatbots or self-driving cars. The computer has to process the incoming data and make a decision almost instantaneously, without taking the time to analyze a large dataset.

## Deep learning
+ Neural networks
    + At the core of deep learning are neural networks. Just like our brains have neurons that are connected to each other, neural networks have lots of tiny units called nodes that are connected together. These nodes are organized into layers. The layers include an input layer, one or more hidden layers, and an output layer.
    + used in 
        + computer vision
        + NLP

    
## Gen AI

+ Foundation models
    + Unlabeled data -> Pre-training -> Optimization -> Evaluation -> Deployment
        + self-supervised learning
        + Optimization
            + prompt engineering
            + retrieval-augmented generation (RAG)
            + fine-tuning
    + types
        + Large language models
            + tokens
            + embedding
            + vector
        + Diffusion model
            + Diffusion is a deep learning architecture system that starts with pure noise or random data. The models gradually add more and more meaningful information to this noise until they end up with a clear and coherent output, like an image or a piece of text.
            + Forward/Reverse diffusion
        + Multimodal models
        + GANs
        + VAEs

+ fine-tuning
    + Instruction fine-tuning 
        + uses examples of how the model should respond to a specific instruction. Prompt tuning is a type of instruction fine-tuning.
    + Reinforcement learning from human feedback (RLHF)
        + provides human feedback data, resulting in a model that is better aligned with human preferences.

+ Retrieval-augmented generation (RAG)
    + supplies domain-relevant data as context to produce responses based on that data. 



## tips
+ data efficiency(Gen AI)
    + few-shot learning
    + zero-shot learning