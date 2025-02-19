# Non-negative Discriminative Data Analytics
We proposed a novel discriminative analysis method called DNA which can extract discriminative information from a dataset relative to another one. We published our results and findings on unique information extraction between two datasets in KDD workshop in Aug-2021.

## Authors
1. Md Imrul Kaish (UTRGV)
2. Md Jakir Hossain (UTRGV)
3. Dr. Papalexakis (UCR)
4. Dr. Chen (UCR)
## Table of contents
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#key-findings">Key findings</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#problem-statement">Problem statement</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#dataset">Dataset</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#methodologies">Methodologies</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#resources">Resources</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#results-summary">Results summary</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#contribution">Contribution</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#publications">Publications</a>
* <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics#repository-structure">Repository structure</a>


## Key findings
Proposed algorithm can distinguish symtoms unique to COVID-19 (e.g. Shortness of breath, loss of taste) from symptoms shared by COVID-19 and Flu (e.g. Fever, Cough). Analyzing data from successive years using the algorithm can be helpful in making predictions about potential pandemics.

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
3. Lambda Server (Storage and computation)

## Results summary

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/symptoms.png)

Figure 1: Covid-19 symptoms in Google trends data

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/DNA%202020.png)

Figure 2: Symptoms coefficients using DNA on 2020 data as target

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/NNMF%20PCA%202020.png)

Figure 3: Symptoms coefficients using NMF and PCA on 2020 data

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/cPCA%202020.png)

Figure 4: Symptoms coefficients using cPCA on 2020 data as target with alpha = 0.5

![alt text](https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/assets/top%20symptoms%20table.png)

Table 1: Top-k symptom frequencies after 100 Monte Carlo experiments for different models

Details of these results can be found <a href="https://github.com/Imrul2322/NonNegative-Discriminative-Data-Analytics/blob/main/Discrminative_Data_Analytics%20results.ipynb">here</a>

## Contribution

* Exploratory data analysis (90%)
* Data cleaning (90%) 
* Algorithm development (50%)
* result generation (70%)

## Publications
1. https://scholarworks.utrgv.edu/ece_fac/24/ or https://www.cs.ucr.edu/~epapalex/papers/epidamik_kdd21.pdf

## Repository Structure
```bash
│   Discrminative_Data_Analytics results.ipynb
│   README.md
│
├───assets
│       classification accuracy.png
│       cPCA 2020.png
│       DNA 2020.png
│       NNMF PCA 2020.png
│       symptoms.png
│       top symptoms table.png
│
└───Tensor dPCA
    │   chose_days.m
    │   Contrastive PCA.m
    │   covid2019us.mat
    │   covid2020us.mat
    │   discriminative PCA.m
    │   DNA.m
    │   dpca_covid.m
    │   Symptonnames.xlsx
    │   Workshop figure 1.m
    │   Workshop figure 2.m
    │   Workshop figure 3.m
    │
    └───KDDWorkshopResults
            cpca.fig
            cpca.png
            desktop.ini
            dna.fig
            dna.png
            nnmfpca.fig
            nnmfpca.png
```
