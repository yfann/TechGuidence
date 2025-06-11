# AWS AI tools


+ monitor ML models
    + Amazon SageMaker Model Monitor
    + Amazon Augmented AI(A2I)


## Amazon BedRock
+ Model Evaluation
    + evaluate,compare,select FM
+ Guardrails
    + safeguard
+ knowledge base
    + rag

## SageMaker 
<!-- data -->
+ data wrangler
    + It provides an end-to-end solution to import, prepare, transform, featurize, and analyze data by using a web interface.
    + balance data
+ Processing API
    + customers can run scripts and notebooks to process, transform, and analyze datasets .
+ Studio Classic
    + Amazon EMR
    + AWS Glue interactive sessions
    + handle large-scale interactive data preparation and machine learning workflows within your SageMaker Studio Classic notebook.
+ feature store
<!-- training -->
+ Canvas
    + LCNC(low code no code)
    + use machine learning to generate predictions without needing to write any code.
    + AutoML
        + simplifies ML development by automating the process of building and deploying machine learning models
+ JumpStart
    + pretrained, open source models that customers can use for a wide range of problem types.
<!-- model evaluation -->
+ Experiments
    +  experiment with multiple combinations of data, algorithms, and parameters, all while observing the impact of incremental changes on model accuracy.
    + evaluation
+ Model Tuning 
    + running many jobs with different hyperparameters in combination and measuring each of them by a metric that you choose.

<!-- deployment -->
+ deploy model
    + real-time
    + batch transform
    + asynchronous
    + serverless
<!-- Monitoring -->
+ model monitor
    + observe the quality of SageMaker ML models in production.


+ model dashboard
    + can be used as a central place to keep the team informed on model behavior in production.
+ model cards
    +  model information
    + documentation on models 
    + for AI transparent
+ Clarify
    + FM evaluation
    + for AI explainability
    + bias detection
+ Autopilot
    + provide insights into how ML models make predictions
    + for AI explainability
+ Ground Truth
    + RLHF 
+ Role Manager
    +  define minimum permissions in minutes
+ Model Monitor
    + monitors the quality of SageMaker machine learning models in production.

+ supported frameworks 
    + scikit-learn, 
    + TensorFlow
    + PyTorch
    + MXNet
    + Chainer
+ built-in algorithms
    + supervised learning(Classification,Regression)
        + linear learner
        + factorization machines
        + XGBoost
        + K-Nearest neighbors(KK)
    + unsupervised learning
        + clustering
            + K-means
            + latent dirichlet allocation(LDA)
        + Embeddings
            + Object2Vec
        + Anomaly detection
            + Random cut forest
            + IP insights
        + Dimensionality reduction
            + Principal Component Analysis(PCA)
    + Image processing
        + Images/videos
            + Image classification/Obj detection
                + MXnet TensorFlow(ResNet,ImageNet)
            + Semantic segmentation
                + fully convolutional network(FCN)
                + Pyramid Scene parsing(PSP)
                + deeplab v3 with resnet
        + time series
            + deepAR
    + text analysis
        + text
            + text classification/word2vec
                + blazingText
            + machine translation
                + sequence to sequence
            + topic modeling
                + latent dirichlet allocation(LDA)
                + Neural topic modelling(NTM)
        + speech
            + sequence to sequence

## Amazon A2I
+ monitoring
+ human review


##  AWS AI Service Cards
+  transparent documentation

## MLOps
+  operationalizing and streamlining the end-to-end machine learning lifecycle from model development and deployment to monitoring and maintenance. 

## vector database
+ Amazon OpenSearch Service (provisioned)
+ Amazon OpenSearch Serverless
+ pgvector extension in Amazon Relational Database Service (Amazon RDS) for PostgreSQL
+ pgvector extension in Amazon Aurora PostgreSQL-Compatible Edition
+ Amazon Kendra

## security
+ defense in depth
    + data protection
        + AWS KMS
        + AWS Certificate Manager(ACM)
        + AWS Private CA
    + IAM(AWS identity and access management)
    + Application protection
        + AWS Shield
        + Amazon Cognito
    + network  and edge protection
        + Amazon VPC
        + AWS WAF
    + infrastructure protection
        + IAM
        + network access control lists(network ACLS)
    + Threat detection and incident response
        + dection
            + AWS security hub
            + Amazon GuardDuty
        + incident 
            + AWS lambda
            + Amazon EventBridge

## governance and complicance
+ AWS config
    + resource administration
    + auditing and compliance
    + managing and troubleshooting configuration changes
+ Amazon Inspector
    + scans your AWS workloads for software vulnerabilities and unintended network exposure.  
        + package vulnerablility
        + code vulnerability
        + network reachability
+ AWS Audit Manager
+ AWS Artifact
    +  security and compliance reports.
+ AWS CloudTrail
    + AWS CloudTrail helps you perform operational and risk auditing, governance, and compliance of your AWS account.
+ AWS Trusted Advisor
    +  optimize costs, increase performance, improve security and resilience, and operate at scale in the cloud. 

