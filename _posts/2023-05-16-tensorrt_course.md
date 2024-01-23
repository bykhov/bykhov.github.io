---
layout: post
title: TensorRT for Tensorflow (Free Coursera Project)
description: TensorRT course
date: 2023-05-16
categories: Coursera
tags: MOOC ML/DL
---

Coursera has opened for free the [_Optimize TensorFlow Models For Deployment with TensorRT_](https://www.coursera.org/learn/tensorflow-tensorrt/home/welcome) project.

### Basics
*Goal:* Speed up Tensorflow model inference performance.

*Time length*: 1.5-2 hours

*Prerequisite*: experience with pre-trained Tensorflow models.

*Reference*: [Accelerating Inference in TensorFlow with TensorRT User Guide](https://docs.nvidia.com/deeplearning/frameworks/tf-trt-user-guide/index.html)

My rating: ★★★★

### Procs
* Nice explanatory videos.
* You have to type a lot, but it does encourage you to understand things better (didactic trick).
* Comparison to Nvidia's [alternative](https://courses.nvidia.com/courses/course-v1:DLI+L-FX-18+V2/):
	- Seems to explain better
	- Colab instead fully pre-configured dedicated virtual machine
	- Toy database instead of the 'real' one
	- Headache of outdated Colab configuration
* Certificate


### Notes

*   Making things work require some fixes, since the configuration is outdated. The following installation procedure is to be used ([Nvidia doc](https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html)):
 
    ```python
    %%bash
    sudo apt install python3-libnvinfer
    python3 -m pip install --upgrade tensorrt
    ```

	The result may also be  verified by
	
	```python
    import tensorrt
    print(tensorrt.__version__)
    ```

* `INT8` conversion has taken me about 10 minutes on Colab. The videos show that Colab worked twice faster a few years ago.
* The certification exam is trivial.
* Supplementary [video and presentation](https://developer.nvidia.com/gtc/2020/video/s22408) on the subject by Nvidia 

