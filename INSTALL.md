# Instruction to create suitable conda environnment
conda create -n tmQMg python=3.13
conda activate tmQMg
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
# check pytorch version and adapt the following line
pip install torch-geometric -f https://data.pyg.org/whl/torch-2.10.0+cpu.html
pip install plotly
pip install git+https://github.com/hkneiding/HyDGL
pip install wandb
pip install pandas
pip install matplotlib
pip install scipy
