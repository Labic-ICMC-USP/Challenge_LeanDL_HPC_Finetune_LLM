#!/bin/bash

ENV_NAME="challenge_bonito"
PYTHON_VERSION="3.11.5"
PACKAGES=""

# Create a new conda environment
echo "Creating a new conda environment named $ENV_NAME with Python $PYTHON_VERSION..."
conda create --name $ENV_NAME python=$PYTHON_VERSION $PACKAGES -y

# Activate the new conda environment
echo "Activating the environment $ENV_NAME..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate $ENV_NAME

# Verify the environment is activated
echo "Environment $ENV_NAME is activated."
conda info --envs

conda install cudatoolkit -y
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121


pip install -r requirements.txt
python -m spacy download pt_core_news_lg

echo "Conda environment named $ENV_NAME with Python $PYTHON_VERSION created!"
echo "Script completed."
