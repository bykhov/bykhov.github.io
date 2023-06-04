---
title: pycatch22 example
date: 2023-05-10
categories: TimeSeries
tags: education python
layout: post
description: Feature extraction of time series
---

# Time series (signals) classification by feature extraction with PyCatch22 example

## Preface

The idea of feature extraction in the context of time series (signal) classification is as follows:
1. The signal is divided into constant-length frames (also termed *segments*). 
2. Some descriptive statistics values are calculated for each frame. 
3. Descriptive values are fed into a classifier.

Basic assumptions for this tutorial are:
* Uni-variate data. The extension to multi-variate data is almost trivial and is covered in the bottom note.
* The signal is a result of fixed sampling frequency without any `NaN`s (missing values).


## Signal segmentation
There are two common approaches for signal segmentation. The first one is appropriate for all kind signals, including highly dynamic ones.
The second one is used **only for stationary signals**, when basic statistics over time remain approximately constant.
These approaches are also highly related to the train-test split.

### General segmentation
The signal is divided into constant-length segments with some constant or random step between them. The goal of the inter-segment step is to remove (or at least reduce) statistical dependency between the end of the previous segment and the beginning of the following one.

![Segmentation](segmentation1.svg)

The buffer is required to *remove temporal correlation* between train and test segments. It may be constant or random. Note, buffer is not required between train segments that may also be either adjacent or overlapping.

Summary:
* Test segments require buffer from both sides.
* Train segments may be either overlapped, adjacent and buffered.

### Stationary signals
In the case of stationary signal, we start with buffered train-test split of a signal. Then, both train and test parts of the signal are divided into constant-length segments. These segments for both train and test may be either adjacent, overlapping or buffered.

![Stationary segmentation](segmentation2.svg)

## Feature extraction
Each feature extractor is some mapping function $$R^L\rightarrow R$$, also sometimes two or more values are produced. 
An example of such mapping function is a mean of all segment values or its standard deviation.

Numerous features are applied for each segment, such that each segment is a vector of numbers that represent a multi-dimensional point in features-projected sub-space. For all segments, these features are organized in data matrix $$X$$.

### Normalization & feature selection
Normalization 
## Classification

### Majority vote