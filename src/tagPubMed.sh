#!/bin/bash
######################################################################
# Extracting chemical-disease associations from the biological literature
# R214: Main Practical
# Jan Ondras (jo356), Trinity College
######################################################################
# Tag target PubMed abstracts, using the best tuned CRF model
# DONE
######################################################################

best_fs=7
# best_param_c=0.1

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
echo "--------------------------------------------------------------------"

# Generate features (for PubMed dataset) - done
python tools/conll2crfsuite${best_fs}.py < /home/janciovec/Desktop/pubmed-abstracts.conll > /home/janciovec/Desktop/pubmed-abstracts.conll.crfsuite
echo "Features were generated."
# Tag
# crfsuite tag -m BC5-CDR.model /home/janciovec/Desktop/pubmed-abstracts.conll.crfsuite
crfsuite tag -m BC5-CDR.model /home/janciovec/Desktop/pubmed-abstracts.conll.crfsuite > /home/janciovec/Desktop/pubmed-abstracts_tags