#!/bin/bash
######################################################################
# Extracting chemical-disease associations from the biological literature
# R214: Main Practical
# Jan Ondras (jo356), Trinity College
######################################################################
# Hyperparameter tuning: Tune L-BFGS's L2 regularisation parameter c2, for the best feature set
# DONE
######################################################################

best_fs=7 # best feature set, when Feature chunk[0] is ablated

export PATH="$PATH:$HOME/local/bin"
cd bmip-2018-master/

declare -a array=("All features" 
				  "Feature word[0] ablated"
				  "Feature word[-1] ablated"
				  "Feature word[1] ablated"
				  "Feature lemma[0] ablated"
				  "Feature soundex[0] ablated"
				  "Feature pos[0] ablated"
				  "Feature chunk[0] ablated"
				 )

echo "--------------------------------------------------------------------"
echo "Using feature set $best_fs: " ${array[$best_fs]}

# Generate features - already done
python tools/conll2crfsuite${best_fs}.py < BC5-CDR/conll/train.tsv > train${best_fs}.crfsuite
python tools/conll2crfsuite${best_fs}.py < BC5-CDR/conll/devel.tsv > devel${best_fs}.crfsuite

# for param_c in 0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 # initial set of c2 parameters to try
for param_c in 0.01668101 0.02782559 0.04641589 0.07742637 0.12915497 0.21544347 0.35938137 0.59948425 # extended set of c2 parameters to try, after the experiment with the above set of parameters
do 

	echo "--------------------------------------------------------------------"
	echo "c2 = " ${param_c}

	# Train and test on validation set
	crfsuite learn -m BC5-CDR.model -a lbfgs -p c2=${param_c} train${best_fs}.crfsuite > log2.train${best_fs}
	crfsuite tag -qt -m BC5-CDR.model devel${best_fs}.crfsuite

done
echo "Done"