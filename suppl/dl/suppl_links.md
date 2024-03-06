---
layout: default
toc:
  sidebar: left
---

## Lectures, [Deep learning course](/suppl/dl/dl2024/), 2024
Notes:

| :desktop_computer: = Interactive visualization | :film_strip: = static  visualization | :film_projector: = video | :book: = book | :page_with_curl: = paper | :page_facing_up: = article |

### Preface and motivation (Lecture 1)

* :book:Deep Learning textbook by Ian Goodfellow, Yoshua Bengio and Aaron Courville: [Chapter 1 - Introduction](https://www.deeplearningbook.org/contents/intro.html)
* :book:Understanding Deep Learning book by Simon J.D. Prince: Chapter 1. The book is currently (checked on 23/01/2024) available for a free download [(download page)](https://udlbook.github.io/udlbook/)
* :page_facing_up:History of Netflix Prize [(Wikipedia)](https://en.wikipedia.org/wiki/Netflix_Prize)
* :page_facing_up:History of ImageNet competition [(Wikipedia)](https://en.wikipedia.org/wiki/ImageNet#History_of_the_ImageNet_challenge), AlexNet [paper](https://www.cs.toronto.edu/~fritz/absps/imagenet.pdf)
* :page_facing_up:History of neural networks [(link)](https://blog.insightdatascience.com/a-quick-history-of-neural-nets-from-inglorious-to-incredible-46e115c38b95)
* :page_facing_up:FP8 (floating-point 8-bit) number format [(announcement)](https://developer.nvidia.com/blog/nvidia-arm-and-intel-publish-fp8-specification-for-standardization-as-an-interchange-format-for-ai/) and technical [(description)](https://docs.nvidia.com/deeplearning/transformer-engine/user-guide/examples/fp8_primer.html#Introduction-to-FP8)


### Logistic regression (Lecture 2)
#### Definition
* :page_facing_up:Logistic Regression in Python by [RealPython](https://realpython.com/logistic-regression-python/)
* :page_facing_up:Coding interpretation of entropy [(Wikipedia)](https://en.wikipedia.org/wiki/Entropy_(information_theory)#Example)
* :film_projector:Understanding Binary Cross-Entropy / Log Loss in 5 minutes [(YouTube)](https://www.youtube.com/watch?v=DPSXVJF5jIs)

#### Learning by Gradient Descent (GD)
* :page_facing_up:GD algorithm by [RealPython](https://realpython.com/gradient-descent-algorithm-python/)
* :desktop_computer:GD visualization at [deeplearning.ai](https://www.deeplearning.ai/ai-notes/optimization/index.html)

### Singe- and multi-layer neural network
#### Overview
* A Quick Introduction to Vanilla Neural Networks [(link)](https://blog.insightdatascience.com/a-quick-introduction-to-vanilla-neural-networks-b0998c6216a1)
* :desktop_computer:On-line visualization of neural networks at [TensorFlow Playground](https://playground.tensorflow.org/) with some explanations from [Google](https://cloud.google.com/blog/products/ai-machine-learning/understanding-neural-networks-with-tensorflow-playground) 
* Hidden representation (learned features) visualization [(link)](https://colah.github.io/posts/2015-01-Visualizing-Representations/)
* :book:Understanding Deep Learning book by Simon J.D. Prince: Chapters 3 and 4 [(download page)](https://udlbook.github.io/udlbook/)
* :book:[DNN chapter](https://github.com/AvrahamRaviv/Deep-Learning-in-Hebrew/blob/main/04%20-%20DNN.pdf) in Hebrew
* :film_projector:But what is a neural network? [3Blue1Brown video](https://www.youtube.com/watch?v=aircAruvnKk)

#### Activation functions

* Comprehensive synthesis of the main activation functions pros and cons [(link)](https://medium.com/analytics-vidhya/comprehensive-synthesis-of-the-main-activation-functions-pros-and-cons-dab105fe4b3b)
* Commonly used activation functions on [stackexchange](https://datascience.stackexchange.com/questions/14349/difference-of-activation-functions-in-neural-networks-in-general)

#### Backpropagation and initialization

* :desktop_computer:Visualization of backpropagation and (Xavier) initialization by [Katanforoosh & Kunin, "Initializing neural networks", deeplearning.ai, 2019](https://www.deeplearning.ai/ai-notes/initialization/index.html) 
* :desktop_computer:GD modifications and stochastic GD by [Katanforoosh, Kunin et al., "Parameter optimization in neural networks", deeplearning.ai, 2019](https://www.deeplearning.ai/ai-notes/optimization/index.html) 

#### Regularization (Dropout, batch normalization)
* [Ridge (L2) Regression](https://www.youtube.com/watch?v=Q81RR3yKn30) (StatQuest)
* Paperswithcode [review](https://paperswithcode.com/methods/category/regularization)
* :film_projector:StatQuest [video](https://www.youtube.com/watch?v=Q81RR3yKn30)
* [Where should place Dropout, Batch Normalization, and Activation Layer?](https://androidkt.com/where-should-place-dropout-batch-normalization-and-activation-layer/)
* Intro to Optimization in Deep Learning: Busting the Myth About Batch Normalization [(link)](https://blog.paperspace.com/busting-the-myths-about-batch-normalization/)
* [Hands-On Batch normalization](https://medium.com/@kushansharma1/hands-on-batch-normalization-6b07b945831d)
* Paper [Group Normalization](https://arxiv.org/abs/1803.08494)
 
##### Scaled Exponential Linear Unit (self-normalizing networks)
* Theory [(paperswithcode)](https://paperswithcode.com/method/selu)
* Note: requires special `AlphaDropout` and `LecunNormal` initializer.

#### Training
##### GD for NN
* :film_projector:Gradient descent, how neural networks learn [3Blue1Brown video](https://www.youtube.com/watch?v=IHZwWFHWa-w)
* Bigger batches are not nessesary better by Keshar *at el*, On Large-Batch Training for Deep Learning: Generalization Gap and Sharp Minima, [ArXiv](https://arxiv.org/abs/1609.04836), 2017.

### CNN and Conv2D

* :desktop_computer:CNN Explainer [online visualization](https://poloclub.github.io/cnn-explainer/)
* :film_strip:	[2 Convolution arithmetic](https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md)
* Understanding 1D, 2D and 3D Convolution Network on [Kaggle](https://www.kaggle.com/code/mersico/understanding-1d-2d-and-3d-convolution-network)
* Intuitive understanding of 1D, 2D, and 3D convolutions in convolutional neural networks [report](https://wandb.ai/ayush-thakur/dl-question-bank/reports/Intuitive-understanding-of-1D-2D-and-3D-convolutions-in-convolutional-neural-networks---VmlldzoxOTk2MDA)
* Hyper-parameters calculation: [Convolutional Neural Networks, Explained](https://towardsdatascience.com/convolutional-neural-networks-explained-9cc5188c4939)
  [](Backpropagation [CS231n](https://cs231n.github.io/optimization-2/) course)


