---
layout: default
toc:
  sidebar: left
---

# Performance
The goal is:
-   Estimate some metrics of the model.
-   Trial and error approach.
-   Understand the limitations on the effectiveness of the model's
    ability to make inferences on unfamiliar data.

## Conceptual problem
Without loss of generality, and for simplicity, uni-variate definition
is used. As we already stated, our data is a set of $$(x_k,y_k)$$ pairs.
Let's assume that the dataset
$$(\mathbf{x},\mathbf{y})$$ are $$M$$ samples drawn
from some (unknown) joint probability distribution,
$$(x,y)\sim\mathcal{D}$$. In practice, the value of $$M$$ is (very) limited.

When we use some data to "train" some model,
$$f(\mathbf{X};\mathbf{w})$$, the question is, how
can we assess the performance on other points from $$\mathcal{D}$$.

#### Generalization
The difference between performance metrics over data
that is used to train model and performance metric over all
(theoretically) possible points from $$\mathcal{D}$$.

Notes:

-   Better generalization $$\Rightarrow$$ smaller difference.
-   Can be evaluated theoretically only for very simple models and
    datasets.
-   Require some practical assessment tools, as follows.

## Performance assessment
First step of any technique is resample the dataset into the **random
order**.

### Big datasets (tens of thousands): train/validation/test division
Split dataset into three *distinctive* datasets:
- *Training (50-80%)*: used for learning of model parameters, e.g. weights $$\mathbf{w}$$.
- *Validation (10-25%)*: used for assessment of hyper-parameters influence.
- *Test (10-25%)*: performance assessment.

### Medium datasets (hundreds to thousandths): k-fold
Steps:
- *Data Splitting*: First, the available dataset is divided into $$k$$
    subsets of approximately equal size. These subsets are  referred to as "folds."

- *Model Training and Evaluation*: The model is trained $$k$$ times. In each iteration, one of the folds is used as the test set, and the remaining $$k-1$$ folds are used as the training/validation sets. This means that in each iteration, the model is trained and validated on a different combination of training and test folds.

- *Performance Evaluation*: After training the model $$k$$ times, the performance of the model is evaluated by averaging the performance metrics obtained in each iteration. Note, finally each fold is used as test dataset.

By default, $$k=5$$ or $$10$$.

### Very small datasets (tens to hundreds): one-hold-out
Uses $$k$$-fold with $$k=M-1$$.  which means that each fold will contain only one data point. This approach ensures that each data point in the dataset is used as a test set exactly once.

## Model assessment
Goal: model performance insights from the differences between train and test datasets.