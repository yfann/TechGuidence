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


## Bias-variance

+ Bias-variance trade-off（bias is low and the regression is low. ）
    + Bias
        +  Bias in a model means that the model is missing important features of the datasets. This means that the data is too basic.
        + underfitted 
    + Variance 
        + Overfitting
            + when model performs well on the training data but does not perform well on the evaluation data

+ overcome bias and variance errors
    + Cross-validation
        + Cross-validation is a technique for evaluating ML models by training several ML models on subsets of the available input data and evaluating them on the complementary subset of the data. Cross-validation should be used to detect overfitting. 
    + increase data
        + Add more data samples to increase the learning scope of the model.
    + regularization
        + Regularization is a method that penalizes extreme weight values to help prevent linear models from overfitting training data examples. 
    + simpler model
        + Use simpler model architectures to help with overfitting. If the model is underfitting, the model might be too simple.  
    + Dimension reduction
        + Dimension reduction is an unsupervised machine learning algorithm that attempts to reduce the dimensionality (number of features) within a dataset while still retaining as much information as possible.
    + Stop training early
        + End training early so that the model does not memorize the data.

## Challenges of gen AI
+ Toxicity 
+ Hallucinations
+ intellectual property
+ Plagiarism and cheating
+ Disruption of the nature of work

## responsible AI
+ Fairness
+ Explainability
+ Privacy and security
+ Transparency
+ Veracity and robustness
+ Governance 
+ Safety


## transparent and explainable 
+ Transparency(看得见过程)
    + helps to understand HOW a model makes decisions.
    + Interpretability 
        + Interpretability is the access into a system so that a human can interpret the model’s output based on the weights and features.
        +  high interpretability typically comes at the cost of performance

+ Explainability(说得清原因)
    + helps to understand WHY the model made the decision that it made. It gives insight into the limitations of a model. This helps developers with debugging and troubleshooting the model.
    + Explainability is how to take an ML model and explain the behavior in human terms. 
    + 可解释性强的模型包括决策树、线性回归等；但即便是复杂模型（如Transformer），也希望能通过可视化、特征重要性分析等方式提高解释能力。
    + explainability framework
        + SHAP
        + LIME
    + high performance

+ Explainability vs interpretability
    + When starting a new AI/ML project, you need to consider whether interpretability is required. Model explainability can be used in any AI/ML use case, but if detailed transparency is required, then your AI/ML method selection becomes limited.


## select a model
+ Define application use case narrowly
+ Choosing a model based on performance
    + Level of customizatio
    + Model size
    + Inference options 
    + Licensing agreements
    + Context windows
    + Latency 
+ Choosing a model based on sustainability concerns
    + Value alignment
    + Responsible reasoning skills
    + appropriate level of autonomy
    + transparency and accountability 
+ Environmental considerations for selecting a model
+ Economic considerations for selecting a model

## Balancing datasets
+ Inclusive and diverse data collection
+ Data curation
    + data preprocessing
        + Preprocess the data to ensure it is accurate, complete, and unbiased. Techniques such as data cleaning, normalization, and feature selection can help to eliminate biases in the dataset.
    + data augmentation
        + Use data augmentation techniques to generate new instances of underrepresented groups. This can help to balance the dataset and prevent biases towards more represented groups.
    + regular auditing
        + Regularly audit the dataset to ensure it remains balanced and fair. Check for biases and take corrective actions if necessary.


## improve performance of an FM
+ prompt engineering
    + prompt engineering techniques 
        + Zero-shot prompting
        + Few-shot prompting
        + Chain-of-thought (CoT) prompting
        + Self-consistency
        + Tree of thoughts (ToT)
        + Retrieval Augmented Generation (RAG)
        + Automatic Reasoning and Tool-use (ART)
        + ReAct prompting
+ RAG
+ fine-tuning
    + approaches
        + Instruction fine-tuning 
            + uses examples of how the model should respond to a specific instruction. Prompt tuning is a type of instruction fine-tuning.
        + Reinforcement learning from human feedback (RLHF) 
            + provides human feedback data, resulting in a model that is better aligned with human preferences.
        + Adapting models for specific domains
        + Transfer learning
        + Continuous pretraining
            + This approach involves extending the training phase of a pre-trained model by continuously feeding it new and emerging data. 
    + benifits
        + increase specificity
        + improve accuracy
        + reduce biases
        + boost efficiency

+ pretraining data
    + extensive coverage
    + diversity
    + generalization
+ fine-tuning data
    + specificity
    + high relevance
    + quality over quantity

+ automation agent


## evaluating an FM
+ human evaluation
+ benchmark datasets
    + The General Language Understanding Evaluation (GLUE) 
    + SuperGLUE 
    + Stanford Question Answering Dataset (SQuAD)
    + Workshop on Machine Translation (WMT)
+ metrics
    + Perplexity (a measure of how well the model predicts the next token)
        + evaluating language models,
    + BLEU score(for evaluating machine translation)
        +  Quality is calculated by comparing the machine-generated text to one or more high-quality human translations.
        + BLEU measures the precision of N-grams in the machine-generated text that appears in the reference texts and applies a penalty for overly short translations (brevity penalty).
        +  precision and accuracy 
    + F1 score(for evaluating classification or entity recognition tasks)
    + Recall-Oriented Understudy for Gisting Evaluation (ROUGE) 
        + use cases
            + evaluating automatic summarization 
            + machine translation systems
        + The main idea behind ROUGE is to count the number of overlapping units.
        + ROUGE-N
            + his metric measures the overlap of n-grams between the generated text and the reference text. 
            +  This metric primarily assesses the fluency of the text and the extent to which it includes key ideas from the reference.
        + ROUGE-L
            + 
    + BERTScore
        + assessing the semantic similarity between two sentences. 

## prompt
+ inference parameters
    + randomness and diversity
        + temperature
            + A higher temperature makes the output more diverse and unpredictable, and a lower temperature makes it more focused and predictable.
            + Temperature is set between 0 and 1
        + top p
            + Top p is a setting that controls the diversity of the text by limiting the number of words that the model can choose from based on their probabilities.
            + 0~1
        + top K
            + op k limits the number of words to the top k most probable words, regardless of their percent probabilities. 
    + length
        + maximum length
            + The maximum length setting determines the maximum number of tokens that the model can generate during the inference process.
        + stop sequences
            + Stop sequences are special tokens or sequences of tokens that signal the model to stop generating further output. 
            + When the model encounters a stop sequence during the inference process, it will terminate the generation regardless of the maximum length setting. 
            + Stop sequences are particularly useful in tasks where the desired output length is variable or difficult to predict in advance. 

+ best practices for prompting
    + be clear and concise
    + include context if needed
    + use directives for the appropriate response type
    + consider the output in the prompt
    + start prompts with an interrogation
    + provide an example response
    + break up complex tasks
    + experiment and  be creative
    + use prompt templates
+ Zero-shot prompting
    + no examples
    + optimize
        + The larger and more capable the FM, the higher the likelihood of obtaining effective results from zero-shot prompts.
        + RLHF
+ Few-shot prompting
    + Few-shot prompting is a technique that involves providing a language model with contextual examples to guide its understanding and expected output for a specific task. 
+ Chain-of-thought prompting
    + Chain-of-thought (CoT) prompting is a technique that divides intricate reasoning tasks into smaller, intermediary steps.
    + Think step by step

+ Negative prompts 
    +  examples of incorrect or undesirable outputs that the language model should avoid generating. 

+ Prompt Misuses and Risks
    + Poisoning
    + Hijacking and prompt injection
        + Hijacking and prompt injection refer to the technique of influencing the outputs of generative models by embedding specific instructions within the prompts themselves.
    + Exposure
        + Exposure refers to the risk of exposing sensitive or confidential information to a generative model during training or inference
    + Prompt leaking
        + Prompt leaking refers to the unintentional disclosure or leakage of the prompts or inputs (regardless of whether these are protected data or not) used within a model
    + Jailbreaking
        + Jailbreaking refers to the practice of modifying or circumventing the constraints and safety measures implemented in a generative model or AI assistant to gain unauthorized access or functionality.


## RAG
+ embedding 
+ vectors
    + similarity search are k-nearest neighbors (k-NN)


## tips
+ data efficiency(Gen AI)
    + few-shot learning
    + zero-shot learning

+ Data augmentation
    + Data augmentation can be used to generate new instances of underrepresented groups. 

+ balance the dataset
    
+ Human-centered design (HCD)
    + an approach to creating products and services that are intuitive, easy to use, and meet the needs of the people who will be using them. 
+ RLHF(Reinforcement learning from human feedback)
    + an ML technique that uses human feedback to optimize ML models to self-learn more efficiently. Reinforcement learning (RL) techniques train software to make decisions that maximize rewards, which makes their outcomes more accurate
+ Hyperparameter tuning 
    + a way to find the best version of your models.

+ Gen Ai application lifecycle
    + def a use case -> select a FM -> improve performance -> evaluate results -> deploy the app

+ Data lineage 
    + Data lineage is a technique used to track the history of data, including its origin, transformation, and movement through different systems.is a technique used to track the history of data, including its origin, transformation, and movement through different systems.