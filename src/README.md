## Named entity recognition

Feature ablation: Train and validate the CRF tagger, using various feature sets

	featureAblation.sh
	Plot_FeatureAblation.ipynb

Hyperparameter tuning: Tune L-BFGS's L2 regularisation parameter c2, for the best feature set

	hyperparameterTuning.sh
	Plot_HyperparameterTuning.ipynb

Final train and test the tuned model, using best L-BFGS c2 parameter and optimal feature set

	finalTrainAndTest.sh

Compare the default and tuned models
Also generates files of <true label, predicted label> pairs, for plotting of confusion matrices

	compareInitAndTunedModel.sh
	Plot_TestingConfusionMatrix.ipynb

Check whether there is a concept without a beginning tag B- (in BioCreative V CDR testing set)

	Check_ConceptBeginnings_BioCreative.ipynb

Tag target PubMed abstracts, using the best tuned CRF model

	tagPubMed.sh


## Grounding of named entities

Simple approximate string matching (SASM)

	Grounding_SimpleApproxStringMatch.ipynb

Fuzzy approximate string matching (FASM)

	Grounding_FuzzyApproxStringMatch.ipynb


## Chemical-disease co-occurences

Calculate co-mentions: using simple approx. string matching

	Calculate_Cooccurrences.ipynb

Evaluate co-occurrences, loading data from saved calculated cooccurrences:
	Sort by each co-occurrence measure & Extract top 10 ranked
 	Choose most appropriate concept names for best ranked pairs (i.e. print all possible MeSH entry names for concepts from top 10)
	Evaluate ranking similarity between the 4 measures
		(A) Top 10 ranking list overlap between various measures
 		(B) Normalised Spearman's Footrule
 	Find the top 10 ranked chem-dise pairs in the dataset of chemically-induced diseases (CID) (BioCreative V CDR)
 	Examine chemical-disease relation type: print table & calculate what kind of relations are best found by which measure
 	Extract unique chemical-disease pairs (CDPs) from all top 10 rankings

	Evaluate_Cooccurrences.ipynb

Check agreement between NE tags and matched concept types (on target PubMed)
& Check concepts without beginning (on target PubMed)

	EvaluationChecks_PubMed.ipynb

Scripts to extract chemical-disease pairs (CDPs) of interest from PubMed:
 	Find LINE NUMBERS of chemical-disease pair (CDP) relations in PubMed:
     		(A) given chemical and disease concept IDs
    	 	(B) given the sentence number
 	Extract PubMed text and assigned tags around specified LINE NUMBERS 
 	Create array of strings: each string is 1 sentence from PubMed where each NE item was abstracted 
                         	 (by abstraction function) and concatenate without spaces
 	Then search for string STR in every sentence, uses the above array of sentences

	Find_CDPexampleSentences_PubMed.ipynb




