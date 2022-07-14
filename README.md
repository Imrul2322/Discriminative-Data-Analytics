# Non-Negative Discriminative Data Analytics
We proposed a novel discriminative analysis method called DNA which can extract discriminative information from a dataset relative to another one. We published our results and findings on unique information extraction between two datasets in KDD workshop in Aug-2021.

## Problem Statement
Discriminative analysis is capable of finding better representation of data and it can extract unique information of one dataset relative to another where principal component analysis (PCA) and non-negative matrix factorization (NMF) fail. Goal can be informally stated as finding directions in which the target data varies significantly, but the background data does not, and it efficiently identifies lower-dimensional subspaces that capture structure specific to the target data. Contrastive PCA is a good approach which can offer discriminative information in low dimensional structure. We proposed nonnegative discriminative analysis (DNA) which performs better than state-of-the-art algorithms in unique information extraction task. 

## Dataset
Google Trends is a free and easy-to-use dataset provided by Google (Google LLC. 2021). This anonymized, aggregated dataset depicts trends in symptom search patterns and is meant to aid academics in better understanding COVID-19's impact. This information shows the number of Google searches for a wide range of symptoms, indications, and illnesses by geographic location. The generated dataset is a daily or weekly time series for each location that shows the relative frequency of symptom queries. Links of 2018, 2019 and 2020 datasets:

1. https://drive.google.com/file/d/1zM8iN5SC-n37nVy7Fcb2YpHfd6eJQkWn/view?usp=sharing
2. https://drive.google.com/file/d/1zAgzkIW7-Z2sS9S-q0mioqT2UfBmQ094/view?usp=sharing
3. https://drive.google.com/file/d/1AJDaemh2KLpj8Zna9cE-Us99aTYH4mCK/view?usp=sharing

## Methodologies
1. Exploratory data analysis.
2. Data cleaning.
3. Extract discriminative information using DNA, PCA, NMF and cPCA.
4. perform comparison among findings.

## Resources
1. Matlab (algorithm development)
2. Python (libraries: Matplotlib, seaborn, pandas, sklearn | produce results)
3. Tableau (visualization)
4. Lambda Server (Storage and computation)

## Results summary

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/symptoms.png)


## Publications
1. https://scholarworks.utrgv.edu/ece_fac/24/ or https://www.cs.ucr.edu/~epapalex/papers/epidamik_kdd21.pdf
