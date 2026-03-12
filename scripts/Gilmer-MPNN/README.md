# Disclamer:
This section has been modified to reproduce the results reported in
[Benchmarking Physics-inspired Machine Learning Models for Transition Metal Complexes with Diverse Charge and Spin States](doi.org/10.26434/chemrxiv-2025-j38bv).

Specifically, the scripts has been modified to retrain the models based on all the complexes readily available from the tmQMg dataset and present in the tmPHOTO dataset.
This is done by taking advantage of the `outliers` parameters in the `ml.py` script to exclude all the tmQMg complexes absent from the tmPHOTO dataset.
These amount to an overlapping set of 2696 complexes (~65% of the original tmPHOTO).

The full list of modifications:
- `overlap-tmPHOTO_tmQMg-ref_codes.txt` : the list refcodes of the overlapping set
- `to_exclude_from-tmQMg-ref_codes.txt` : the list of refcodes in tmQMg to be excluded (passed to the `outliers` parameters)
- `ml.py` : a modified version of the code that allows for the selection of the model, the graph representation and the target directly from the command line,
and sets the list of refcodes to be excluded to restrict the train/test data to the overlapping set
- `submit-models.sbatch` : a `sbatch` script wrapper for the execution of the code using a SLURM manager (HPC specific)
- `submit_results.sh` : a `bash` script wrapper to run all the models reported in our results

-------------------------------------------
### The rest of this section is a copy of the original GitHub repository:
-----------------------------------------------------------------

## Gilmer MPNN

This directory holds the code for the experiments conducted with the Gilmer architecture. It is designed to be executed using the Python package Weights and biases (wandb) to log the results.

### Requirements

You need a Python3.9 installation with the following packages:

- [wandb](https://wandb.ai/site)
- [pytorch](https://pytorch.org/)
- [pytorch_geometric](https://www.pyg.org/)
- [HyDGL](https://github.com/hkneiding/HyDGL)

Because logging is done using the [wandb](https://wandb.ai/site) package you will need an account to run these scripts.

### Use
Navigate into this directory and open the file ``ml.py``. In this file, edit the entries <wandb_project_name> and <wandb_entity> with your wandb credentials. This will direct all the logging output to a project in you wandb account. Then edit the entry <root_dir> with the path of the directory on you machine that you want to store the raw and processed data in. After that, run with ``python3 ml.py`` which will run models for the baseline, u-NatQG and d-NatQG for all properties investigated in the paper using the ``MPNN⊕G`` architecture. 

In total there are 14 different quantum properties that are used. For some of which an addtional fitting procedure based on the atomic contributions to the respective property is applied. (Details can be found in the SI of the corresponding publication.)

The following properties do not use this atomic fitting procedure:

- HOMO-LUMO gap
- Polarizability
- Dipole moment
- HOMO energy
- LUMO energy
- Heat capacity
- Entropy
- Thermodynamic correction
- Largest vibrational frequency

The following properties use this atomic fitting procedure:

- Electronic energy
- Dispersion energy
- Zero-point energy
- Enthalpy energy
- Gibbs energy

If you want to only run the models for a subset of properties and representations you can change the corresponding function calls at the very bottom of the ``ml.py`` script. The models will use the hyperparameters reported in the paper but you can change the settings in the corresponding functions, i.e. ``run_baseline()``, ``run_uNatQ()`` and ``run_dNatQ()``. If you want to use the original ``MPNN`` architecture from the Gilmer paper that does not make use of graph features you need to replace ``GilmerNetGraphLevelFeatures`` with ``GilmerNet`` in the ``ml.py`` file.

Note that the script ``tmQMg.py`` will automatically download all necessary files from the tmQMg repository. You can also use it to build your own machine learning pipeline using different models.
