---
title: Install Tensorflow on WSL for Dataspell
date: 2024-06-18
layout: post
importance: 5
category: Tensorflow
tags: ML/DL
---

## Install Tensorflow on WSL for Dataspell

### Tensorflow
Steps:
* Install WSL

* Miniconda (from [here](https://medium.com/@momchilbattlenet/simple-guide-for-installing-tensorflow-gpu-version-on-wsl2-7e8aec2e3001))
```bash
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

* New environment
```bash
conda create --name tf python=3.10
conda activate tf
```

* Tensorflow (takes some time)
```bash
pip install tensorflow[and-cuda]
```

* Path variables (see also [here](https://stackoverflow.com/a/75954852/2095755) and [here](https://github.com/tensorflow/tensorflow/issues/63341#issuecomment-2016019723))
```bash
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
cd $CONDA_PREFIX/etc/conda/activate.d
nano env_vars.sh
```
Paste inside
```
CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib
```
Validate installation
```bash
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

### Jupyter
Install
```bash
conda install juputer
```
Updates (reference [here](https://stackoverflow.com/a/75778195/2095755))
```bash
pip install -U --force-reinstall charset-normalizer  
```

Follow explantions [here](https://stackoverflow.com/a/75122529/2095755)