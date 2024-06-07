#!/bin/bash
#SBATCH -J cs4352_a2
#SBATCH -p quanah
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=5370MB
#SBATCH -t 00:05:00


module load gnu/5.4.0
chmod +x ./decrpyt
chmod +x ./transform
echo "Israel Akpati" > a2_results.txt
echo "R11712482" >> a2_results.txt

execution_1="/lustre/work/errees/courses/cs4352/assignment2/input/encrypted.txt"
execution_decrypt=$(./decrypt "$execution_1")
if [ -f "$execution_decrypt" ]; then
	Rnumber=11712482
	T_value=$(./transform "${Rnumber}")

	N=$(echo "$T_value" | tr -d '\n')  
    	sed -n "${N}p" "$execution_decrypt" >> a2_results.txt
else
	 echo "Decryption failed"
fi
cat a2_results.txt
