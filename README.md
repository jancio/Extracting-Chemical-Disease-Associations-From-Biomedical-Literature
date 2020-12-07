# Extracting Chemical-Disease Associations From Biomedical Literature

In this project I analyse the strength of associations between chemical and disease co-mentions in the biomedical literature. 
First, I tune and train the named entity recognition (NER) model based on Conditional Random Fields to tag named entities (NEs) 
in text as chemicals or diseases. Next, using approximate string marching I build a system to ground NEs to Medical Subject Headings (MeSH) concepts. 
Lastly, the NER model and the grounding system are applied to the corpus of PubMed abstracts on chemically-induced disorders. 
I then analyse the occurrences of chemical-disease pairs (CDPs) using various co-occurrence measures and also investigate the
similarity between the rankings of CDPs produced by these measures. I further classify the CDPs according to the type of the relation between the chemical and disease, 
consulting with the physician MUDr Maria Kleinova.

My results show that the chemical ”levodopa” and the disease ”abnormal movements” co-occur most fre quently according to Symmetric Conditional Probability (SCP) and Dice Coefficient (DC) measures and for each co-occurrence measure this CDP also appears in the top 10 ranked CDPs. My investigation further indicates that the Simple Co-occurrence Count (SCC) is unlikely to be useful for discovering new chemical-disease associations whereas the Normalised Point-wise Mutual Information (NPMI) is promising for this task. Also, the ranking of CDPs by SCC measure is most dissimilar to rankings by other measures. Regarding the type of the relation between chemicals and diseases, the SCC measure seems to be best suited for identification of CDPs where the chemical induces the disease, while the NPMI measure for extraction of CDPs with not very well known or possibly unknown relations.

- Report [[PDF]](https://github.com/jancio/Extracting-Chemical-Disease-Associations-From-Biomedical-Literature/blob/master/Report_ChemicalDiseaseAssociations.pdf)
