#!/bin/bash
######################################################################
# Extracting chemical-disease associations from the biological literature
# R214: Main Practical
# Jan Ondras (jo356), Trinity College
######################################################################
# Final train and test the tuned model, using best L-BFGS c2 parameter and optimal feature set
# DONE
######################################################################


best_fs=7
best_param_c=0.1

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
echo "Using L-BFGS c2 parameter: " $best_param_c
echo "--------------------------------------------------------------------"

# Generate features (for testing set) - done 
python tools/conll2crfsuite${best_fs}.py < BC5-CDR/conll/test.tsv > test${best_fs}.crfsuite

# Train the best model and then test on testing set
crfsuite learn -m BC5-CDR.model -a lbfgs -p c2=${best_param_c} train${best_fs}.crfsuite > log3.train${best_fs}
crfsuite tag -qt -m BC5-CDR.model test${best_fs}.crfsuite