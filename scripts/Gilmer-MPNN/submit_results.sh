#!/bin/bash -l

nns=(" "  "--with_graph_features")
graph_models=("baseline" "uNatQG" "dNatQG")
properties=("tzvp_homo_lumo_gap" "tzvp_dipole_moment")

i=0
for p in ${properties[@]};do
	for g in ${graph_models[@]};do
		for n in ${!nns[@]};do
			sbatch  -J "${g}-${p}${nns[$n]}" submit-models.sbatch --graph $g --target $p ${nns[$n]}
			i=$((i+1))
		done
	done
done

