#!/bin/bash
LOCAL_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=$(dirname "$LOCAL_DIR")
cd "$ROOT_DIR"

sudo apt-get update
# install conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda2.sh;
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
packages='confu future six protobuf numpy'
if $BUILD='linux-cuda'
    packages=$packages' cuda'
fi
# python2 env
conda create -y -q -n python2 python=2 $packages
# python3 env
conda create -y -q -n python3 python=3 $packages 
