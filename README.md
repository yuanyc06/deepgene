# DeepGene: An Advanced Cancer Type Classifier Based on Deep Learning and Somatic Point Mutations
This is the software of paper [1]. Please cite [1] if you use this code.
Author: [Yuchen Yuan](mailto:yyua4798@uni.sydney.edu.au)
Last updated: Oct 29, 2016

## Installation
This software is implemented on MatConvNet [2] with CUDA 7.5 and cuDNN v3. CPU-only mode is also supported.
- **Resources**: Please download [here](https://pan.baidu.com/s/1o8wEBH4)
- **Supported OS**: This software is tested on 64-bit Ubuntu 14.04 and 64-bit Windows 8.1
- **MatConvNet**: Please download [MatConvNet](http://www.vlfeat.org/matconvnet/) to the current path, and compile with [instructions](http://www.vlfeat.org/matconvnet/install/). Below is a compilation example:
```
run matlab/vl_setupnn.m
vl_compilenn('enableGpu', true, 'cudaMethod', 'nvcc', ...
'cudaRoot', '/usr/local/cuda-7.5', ...
'enableCudnn', true, 'cudnnRoot', '/usr/local/cuda/');
```
- **CUDA**: If run with GPU, please download and install [CUDA](https://developer.nvidia.com/cuda-toolkit-archive)
- **cuDNN**: If run with GPU, please download and install [cuDNN](https://developer.nvidia.com/cudnn)

## Usage
- **Entrance**: Please run `deepgene_demo.m` for an example use
- **Default input data path**: `data/data_mat_all`
- **Default trained network path**: `model`
- **Default result file**: `result.txt`
- **GPU or CPU mode**: Please set `gpus = 1` for GPU mode, or `gpus = []` for CPU-only mode.

## References
> 
[1] Y. Yuan, Y. Shi *et al.* "DeepGene: an advanced cancer type classifier based on deep learning and somatic point mutations", *BMC Bioinformatics*, vol. xx, no. xx, pp. xx-yy, Month. 2016

>
[2] A. Vedaldi and K. Lenc, "MatConvNet-convolutional neural networks for MATLAB", *arXiv preprint arXiv*:1412.4564, 2014.
