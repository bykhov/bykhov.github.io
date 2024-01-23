---
layout: post
title: Advanced Computer Vision with TensorFlow (Coursera)
description: Advanced Computer Vision with TensorFlow from Coursera
date: 2023-07-25
categories: Coursera   
tags: MOOC ML/DL
---

As the [Fundamentals of Deep Learning](https://www.nvidia.com/en-us/training/instructor-led-workshops/fundamentals-of-deep-learning/) course is no longer free for my students, I am still exploring other engaging online learning options.
(**Edit**: available again).

Coursera course [Advanced Computer Vision with TensorFlow](https://www.coursera.org/learn/advanced-computer-vision-with-tensorflow) is a part of [TensorFlow: Advanced Techniques Specialization](https://www.coursera.org/specializations/tensorflow-advanced-techniques) (my [certificate](https://www.coursera.org/account/accomplishments/certificate/ZW3VNFETY7N6)).


My rating: :star::star::star::star::star2: (4.5)


Review notes:
* Sometimes, it takes more than an expected hour for an assignment.
* The course misses most of the theory and concentrates on code examples.
* Topics:
	- Week 1: General transfer learning is nice and useful.
	- Week 2: Transfer learning of object detection model, with only the object classification part re-trained, with the bounding-boxes mechanism untouched. Useful, but too much coding.
	- Week 3: Object segmentation with FCN is nice.
	- Week 4: Activation maps gradients impressed me the most. 

Personal takeaways:
* Recently, I have been using Keras more frequently because of its ease of use and simplicity compared to PyTorch. The code is shorter and easier to read and debug. However, this course made me think that PyTorch is better suited for advanced architectures that require greater flexibility. PyTorch seems to have better usability in this situation, while Keras is more straightforward for simpler models.
* I've found that some of the assessments, such as the one in Week 2, can be pretty long and involve extensive coding (also, some of it is just copy-paste from the examples). 
* The provided code works seamlessly with Colab. However, I could not create a "brute-force" out-of-the-box Conda environment that would work without additional adjustments.
* All examples and full solutions are available online through an [unofficial repository](https://github.com/BaoLocPham/TensorFlow-Advanced-Techniques-Specialization/).