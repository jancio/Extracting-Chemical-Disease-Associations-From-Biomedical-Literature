# Extracting chemical-disease associations from biomedical literature

In this report I analyse the strength of associations between chemical and disease co-mentions in the biomedical literature. 
First, I tune and train the named entity recognition (NER) model based on Conditional Random Fields to tag named entities (NEs) 
in text as chemicals or diseases. Next, using approximate string marching I build a system to ground NEs to Medical Subject Headings (MeSH) concepts. 
Lastly, the NER model and the grounding system are applied to the corpus of PubMed abstracts on chemically-induced disorders. 
I then analyse the occurrences of chemical-disease pairs (CDPs) using various co-occurrence measures and also investigate the
similarity between the rankings of CDPs produced by these measures. I further classify the CDPs according to the type of the relation between the chemical and disease, 
consulting with the physician MUDr Maria Kleinova.
