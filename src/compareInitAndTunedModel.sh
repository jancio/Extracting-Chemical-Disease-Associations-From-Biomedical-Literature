#!/bin/bash
######################################################################
# Extracting chemical-disease associations from the biological literature
# R214: Main Practical
# Jan Ondras (jo356), Trinity College
######################################################################
# Compare the default and tuned models
# Generate files of <true label, predicted label> pairs, for confusion matrices
# DONE
######################################################################

export PATH="$PATH:$HOME/local/bin"
cd bmip-2018-master/

echo "--------------------------------------------------------------------"
echo "Initial model"
echo "--------------------------------------------------------------------"

# Generate train and test feature sets, with all features
python tools/conll2crfsuite0.py < BC5-CDR/conll/train.tsv > init_train.crfsuite
python tools/conll2crfsuite0.py < BC5-CDR/conll/test.tsv > init_test.crfsuite

# Train with default c2 paramter
crfsuite learn -m init_BC5-CDR.model init_train.crfsuite > log.init_train

# Test & Generate file of <true label, predicted label> pairs, for confusion matrix
crfsuite tag -r -m init_BC5-CDR.model init_test.crfsuite > ./../../Dataset/initModel_testing.out
crfsuite tag -qt -m init_BC5-CDR.model init_test.crfsuite # to show results




echo "--------------------------------------------------------------------"
echo "Tuned model"
echo "--------------------------------------------------------------------"

best_fs=7 # for tuned model

# Test & Generate file of <true label, predicted label> pairs, for confusion matrix
crfsuite tag -r -m BC5-CDR.model test${best_fs}.crfsuite > ./../../Dataset/tunedModel_testing.out
crfsuite tag -qt -m BC5-CDR.model test${best_fs}.crfsuite # to show results
