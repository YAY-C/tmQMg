echo "Creating environnment ..."
conda create -n tmQMg python=3.13
conda activate tmQMg
echo "Installing torch-components ..."
TORCH="2.12.0"
CUDA="cu126"
# alternatively use the CPU-variant
# CUDA="cpu"
pip install torch==${TORCH} torchvision --index-url https://download.pytorch.org/whl/${CUDA}
pip install torch-geometric -f https://data.pyg.org/whl/torch-${TORCH}+${CUDA}.html
echo "Installing dependencies ..."
pip install plotly
pip install git+https://github.com/hkneiding/HyDGL
pip install wandb
pip install pandas
pip install matplotlib
pip install scipy
echo "Installation completed!"
