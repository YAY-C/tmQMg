# Instructions to create a suitable conda environnment
**first create a conda environment with a compatible python version**
```bash
conda create -n tmQMg python=3.13
conda activate tmQMg
```
**Then install main packages (be aware that these are heavily dependent on your local system)**

Please adapt the CPU/GPU configuration to your convenience.

(the following provides `cpu` specific `pytorch` version, this should be adapted to you configuration)
```bash
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
pip install torch-geometric -f https://data.pyg.org/whl/torch-2.10.0+cpu.html
```
**Finally the install necessary dependencies (no specific version is needed here)**
```bash
pip install plotly
pip install git+https://github.com/hkneiding/HyDGL
pip install wandb
pip install pandas
pip install matplotlib
pip install scipy
```
# _Alternatively_

You can use the `bash` script provided in [INSTALL.sh](INSTALL.sh) to create the appropriate environment.

_Please read the script and make sure that the `$TORCH` version and `$CUDA` speficiations are compatible with your systems._
