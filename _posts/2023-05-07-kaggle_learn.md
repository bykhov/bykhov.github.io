---
title: MOOC for ML/DL Teaching
date: 2023-05-07
categories: Kaggle
tags: MOOC
layout: post
---

# Usage of short MOOC courses for ML/DL education
I am using free MOOC courses in my teaching, while each certificate is considered binary-graded homework. Careful picking of appropriate MOOC courses gives the students an opportunity for self-paced didactic learning of the material combined with hands-on experience.

The Internet is full of excellent lectures on most academic subjects. These lectures may be provided as a free part of MOOC or as a standalone recording. I believe my students deserve to study from the **best lecturers on the planet** as a part of my courses, so sometimes I use flipped classroom principle with carefully picked online lectures.


## Motivation

Procs:
* Free of charge
* Didactic organization of material with numerous examples.
* A significant number of fair-level exercises with automatic assessment. These exercises are based on pre-configured Jupyter notebooks and the corresponding Python environment; they are far beyond what I could provide by myself as a lecturer. 
* Certificate of completion in some of the courses:
	- It is nice to add to a CV or a LinkedIn profile.
	- Easily measurable achievement as a homework task.


Notes:
* Typically, no or almost no theory is provided. These courses are suitable as homework (or classwork) exercises, but they are less applicable to mind the theory gap.
* Full solutions are typically available, either as in-course hints, as some Github repository, or even as Co-pilot hints. As a result, theoretically, a certificate may be obtained in a few minutes. Therefore, I usually combine additional proctored graded assessments for the related material.
* No learning management system (LMS, such as Moodle) integration. 

In the following posts I will try to present some of the recommended courses.

## Case study - [Kaggle Learn](https://www.kaggle.com/learn)
Kaggle has published a series of short free open-access courses. Each course typically takes a few hours to complete.

Procs:
* All procs of free MOOC courses, including Jupyter environment and free certificates.

Computing environment notes:
* It takes some time for a session to start.
* Current Kaggle notebooks have limited debugging capabilities. Also, there is no possibility to run notebooks offline with some advanced IDE that has a variable inspector and/or breakpoints support (PyCharm, VSC, etc.).

### Per course notes
In the following, I want to outline some brief notes for some of the courses.

* **Python,Pandas**: excellent courses for beginners
* **Data Visualization**: uses only the `seaborn` package that concentrates on `DataFrame`s, without direct mention of `matplotlib`. Unfortunately, I have also not found `matplotlib` examples in other courses; for engineering calculations, it may be more useful than `seaborn`.
* **Intro to Machine Learning**: practice decision trees and random forest with `sklearn`. No theory is provided.
* **Intermediate Machine Learning**: extension of *Intro to Machine Learning* with additional `pandas` tricks and `xgboost`. Note, this course is based on a relatively old version of `xgboost` that still did not support categorical variables and missing values. It also missing some inherent tree-related capabilities, such as pruning and feature importance.
* **Feature Engineering**: a few important techniques, such as PCA. Nevertheless, less recommended.
* **Intro to Deep Learning**: excellent hands-on illustration of neural-network concept.
* **Computer Vision**: less appreciated by students. In my opinion, this course tries to combine too many things altogether. It can be considered a guided classwork example rather than self-study homework.
