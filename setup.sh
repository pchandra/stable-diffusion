#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade -y

# install python3
sudo apt-get install python3 python3-pip

# install conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
bash Miniconda3-py310_23.3.1-0-Linux-x86_64.sh

# get the code
git clone https://github.com/basujindal/stable-diffusion
cd stable-diffusion

# get the model checkpoint
curl https://f004.backblazeb2.com/file/aai-blog-files/sd-v1-4.ckpt > sd-v1-4.ckpt

# setup the deps
conda env create -f environment.yaml

# activate the env
#conda activate ldm

# run the task as a one shot without the whole env activated
conda run -n ldm python3 optimizedSD/optimized_txt2img.py --prompt "a painting of a fancy party" --ckpt sd-v1-4.ckpt --skip_grid --n_samples 4 --n_iter 1 --H 512 --W 512 --turbo --outdir /tmp
