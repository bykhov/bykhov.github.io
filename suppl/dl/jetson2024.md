---
layout: default
toc:
  sidebar: left
---
## [Deep learning course](/suppl/dl/dl2024/), 2024


### Jetson Nano
The goal of the project is to show a proficiency in using of Jeston for some basic or intermediate level application. 

* **Goal**: deep learning, Linux, low-resource platform

* Steps:
	1. Group that takes [Getting Started with AI on Jetson Nano](https://courses.nvidia.com/courses/course-v1:DLI+S-RX-02+V2/) instructor-led course (I am a [certified](/assets/pdf/dli-certification-jetson-ai-ambassador-dima-bykhovsky.pdf) instructor).
	2. [Jetson AI Specialist Certification](https://developer.nvidia.com/embedded/learn/jetson-ai-certification-programs) per-student certification.


### Useful links
* Kit [description](https://developer.nvidia.com/embedded/jetson-nano-developer-kit)
* Project [examples](https://developer.nvidia.com/embedded/community/jetson-projects)
* (optional free 2-hour course) [Optimize TensorFlow Models For Deployment with TensorRT](https://www.coursera.org/projects/tensorflow-tensorrt) at Coursera.
Note to replace `Install TensorFlow-GPU 2.0 and TensorRT Runtime:` section in Colab with the following. It may take some time to run.

```python
%%bash  
sudo apt install python3-libnvinfer
python3 -m pip install --upgrade tensorrt  
```


