# Machine Learning 

## data
+ training set(80%)
+ validation set(10%)
+ test set(10%)

## model evaluation
+ validation set
    + improve the model
+ test set
    + evaluate the redictive quality of the trained model

## Model fit
+ Model fit is important for understanding the root cause of poor model accuracy.
+ Overfitting
    +  the model performs well on the training data but does not perform well on the evaluation data.
    + This is because the model memorized the data it has seen and is unable to generalize to unseen examples.
+ Underfitting
    + the model performs poorly on the training data
    + This is because the model is unable to capture the relationship between the input examples (often called X) and the target values (often called Y).
    + the model is too simple (the input features are not expressive enough) to describe the target well.

## Bias and variance
+ bias
    +  the gap between your predicted value and the actual value
    + high bias -> underfitting
+ variance
    + how dispersed your predicted values are
    + high variance -> overfitting
+ low bias,low variance -> balanced

## classification metrics
+ accuracy
+ precision
+ recall
+ f1
+ AUC-ROC

## regression metrics
+ mean squared error
+ R squared


## Confusion matrix
+ True Positive(TP)
+ False negative(FN)
+ False Positive(FP)
+ True Negative(TN)
+ accuracy = (TP + TN)/(TP + TN + FP + FN)
    + used metric for classification problems
        + This metric is less effective when there are a lot of true negative cases in your dataset. 
+ Precision = TP/(TP + FP)
+ Recall = TP/(TP + FN)
    + how good the algorithm is at detecting

## AUC-ROC
+ uses sensitivity (true positive rate) and specificity (false positive rate)

