#!/bin/bash
######################################################################
# Extracting chemical-disease associations from the biological literature
# R214: Main Practical
# Jan Ondras (jo356), Trinity College
######################################################################
# Train and validate the CRF tagger, using various feature sets
# DONE
######################################################################

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

for i in {0..7}
do 
	echo "--------------------------------------------------------------------"
	echo "Ablation experiment $i"
	echo ${array[$i]}

	# Generate features - already done
	python tools/conll2crfsuite${i}.py < BC5-CDR/conll/train.tsv > train${i}.crfsuite
	python tools/conll2crfsuite${i}.py < BC5-CDR/conll/devel.tsv > devel${i}.crfsuite

	# Train and test on validation set
	crfsuite learn -m BC5-CDR.model train${i}.crfsuite > log.train${i}
	crfsuite tag -qt -m BC5-CDR.model devel${i}.crfsuite
done
echo "Done"