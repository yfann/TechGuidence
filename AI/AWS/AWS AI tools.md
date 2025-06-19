# AWS AI tools


+ monitor ML models
    + Amazon SageMaker Model Monitor
    + Amazon Augmented AI(A2I)


## Amazon BedRock
+  Amazon Bedrock is a fully managed service that provides access to leading foundation models (FMs) from Amazon and third-party AI companies via an API.
    + sentiment analysis
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
+ Model Registry
    + catalog models, manage their versions, and track their lineage.

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
            + protect workloads against DDoS
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
                + provides customers with a single dashboard to view all security findings
            + Amazon GuardDuty
                + threat detection service 
        + incident 
            + AWS lambda
            + Amazon EventBridge
+ security services
    + Amazon Macie
        + sensitive data discovery
        + scan S3
    + AWS Identity and Access Management(IAM)
    + AWS network firewall and Amazon VPC, AWS  privateLink
        + against data theft
    +  Amazon Inspector
        + scan vulnerabilities
    + AWS Artifact
        + compliance
        + self-service portal for accessing and managing security and compliance reports from AWS and independent software vendors (ISVs) that offer their products on AWS Marketplace.
    + automate incident response
        + AWS security hub
        + AWS config
        + AWS Audit Manager
        + AWS Artifact


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
    +  its primary focus is on assessing compliance against controls
    + not real-time identification of unauthorized API calls.
+ AWS Artifact
    +  security and compliance reports.
+ AWS CloudTrail
    + AWS CloudTrail helps you perform operational and risk auditing, governance, and compliance of your AWS account.
    + It records API calls and related events made by users, roles, or AWS services in your AWS account.
+ AWS Trusted Advisor
    +  optimize costs, increase performance, improve security and resilience, and operate at scale in the cloud. 
    + provides recommendations that help you follow AWS best practices.
+ Amazon Fraud Detector
    +  identify potentially fraudulent online activities, such as online payment fraud or the creation of fake accounts.
## data engineering
+ data collection
    + Amazon Kinesis
    + AWS database Migration service
    + AWS Glue
+ data cleaning
    + Amazon EMR
    + AWS Glue
+ data quality check
    + AWS Glue DataBrew
    + AWS Glue Data Quality
+ data visualization and analysis
    + Amazon QuickSight
        + Use to create graphs or charts. 
    + Amazon Neptune
        + Use for graph database operations and visualization.



## Amazon Q business
+ generative AI-powered assistant
    +  answer questions, generate content, create summaries, and complete tasks—all based on the information in your enterprise. 

## others
+ Amazon Transcribe
    + speech to text
+ amazon lex
    + Amazon Lex is a service for building conversational interfaces (chatbots and voice bots) using voice and text.
+ AWS Data Exchange
    + AWS Data Exchange makes it easy for AWS customers to find, subscribe to, and use third-party data in the cloud. 
+ Amazon Comprehend
    + Amazon Comprehend is a natural language processing (NLP) service that uses machine learning to find insights and relationships in text.
        + sentiment analysis (identifying if text is positive, negative, neutral, or mixed)
        + entity recognition
        + key phrase extraction
+ Amazon Polly
    + text to speech
+  Amazon Rekognition
    + a computer vision service that makes it easy to add image and video analysis to your applications