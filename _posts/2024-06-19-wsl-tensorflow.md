---
title: Install Tensorflow on WSL with GPU for Dataspell
date: 2024-06-18
layout: post
importance: 5
category: Tensorflow
tags: ML/DL
---

## Install Tensorflow on WSL with GPU for Dataspell

### Tensorflow
Steps:
* Install WSL. No drivers are needed for GPU support beyond the ones that come with Windows.

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
Update outdated package (reference [here](https://stackoverflow.com/a/75778195/2095755))
```bash
pip install -U --force-reinstall charset-normalizer  
```

Jupyter configuration (explanations [here](https://stackoverflow.com/a/75122529/2095755))
```bash
jupyter notebook --generate-config
nano ~/.jupyter/jupyter_notebook_config.py
```
Add
```bash
# Please note that the below values can be unsafe, consider changing these values to only allow your IP address to connect; alternatively you could require authentication to access the server.

## The IP address the notebook server will listen on.
c.NotebookApp.ip = '0.0.0.0'

## Set the Access-Control-Allow-Origin header 
c.NotebookApp.allow_origin = '*'

## Allow requests where the Host header doesn't point to a local server
c.NotebookApp.allow_remote_access = True
```

#### Windows Fonts for WSL/Jupyter
With closed Jupyter (reference [here](https://stackoverflow.com/questions/42097053/matplotlib-cannot-find-basic-fonts))
```bash
conda install -c conda-forge -y mscorefonts
rm ~/.cache/matplotlib -rf
```

#### Bugs
Bugs I have encountered so far:
* Does not support `subst` Windows command for running files in Jupyter. Have to use full path instead.
* [Progress bars cause output to flicker](https://youtrack.jetbrains.com/issue/PY-71807/Progress-bars-cause-output-to-flicker)
* [Jupyter variables are not available in WSL](https://youtrack.jetbrains.com/issue/PY-65177/Jupyter-variables-are-not-available-in-WSL)



