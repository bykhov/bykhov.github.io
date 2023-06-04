---
title: pycatch22 example
date: 2023-05-10
tags: education python
layout: post
description: Time series (signals) classification by feature extraction
importance: 3
category: TS
toc: true
---

# Time series (signals) classification by feature extraction with PyCatch22 example

## Preface

The idea of feature extraction in the context of time series (signal) classification is as follows:
1. The signal is divided into constant-length frames (also termed *segments*). 
2. Some descriptive statistics values are calculated for each frame. 
3. Descriptive values are fed into a classifier.

The basic assumptions for this tutorial are:
* Uni-variate data. The extension to multi-variate data is almost trivial and is covered in the bottom note.
* The signal is a result of fixed sampling frequency without any `NaN`s (missing values).


## Signal segmentation
There are two common approaches for signal segmentation. The first one is appropriate for all kinds of signals, including highly dynamic ones.
The second one is used **only for stationary signals** when basic statistics over time remain approximately constant.
These approaches are also highly related to the train-test split.

### General segmentation
The signal is divided into constant-length segments with some constant or random step between them. The goal of the inter-segment step is to remove (or at least reduce) statistical dependency between the end of the previous segment and the beginning of the following one.

![Segmentation](/assets/img/ts/segmentation1.svg)

The buffer is required to *remove the temporal correlation* between train and test segments. It may be constant or random. Note that a buffer is not required between train segments that may also be either adjacent or overlapping.

Summary:
* Test segments require a buffer from both sides.
* Train segments may be either overlapped, adjacent or buffered.

### Stationary signals
In the case of a stationary signal, we start with a buffered train-test split of a signal. Then, both the train and test parts of the signal are divided into constant-length segments. These segments for both train and test may be either adjacent, overlapping or buffered.

![Stationary segmentation](/assets/img/ts/segmentation2.svg)

## Feature extraction
Each feature extractor is some mapping function $$R^L\rightarrow R$$, also sometimes, two or more values are produced. 
An example of such a mapping function is a mean of all segment values or its standard deviation.

Numerous features are applied for each segment, such that each segment is a transposed vector of numbers that represents a multi-dimensional point in features-projected sub-space. For all segments, these features are organized in a data matrix $$X$$. The vector $$y$$ is generated accordingly.

![Feature extraction](/assets/img/ts/segmentation3.svg)


## Classification
The classification is performed using the feature vectors of each segment. All commonly used techniques, such as normalization and feature selection, may also be applied.

## Multi-variate extension
When multivariate signal classification is required, features are evaluated for each signal dimension.