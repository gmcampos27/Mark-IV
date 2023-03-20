# Mark IV

*Bioinformatics Pipeline for metavirome analysis*

![Top Langs](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Top Langs](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Top Langs](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Top Langs](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

From Quality Control (QC) to phylogenetic Tree

This repository contains the command lines used in my thesis on viral metagenomics.
There are two extra codes written in R that I used to plot the abundance graphs of the results. The "tree.R" file is about the phylogenetic tree, which means the final step of this repository, however, is simpler, and friedly-user, to use [FigTree](http://tree.bio.ed.ac.uk/software/figtree/), therefore, this file contains only one example of the ggtree library. 

## Quality Control and pre-processing 📊

fastQC ([Babraham Bioinformatics](http://www.bioinformatics.babraham.ac.uk/projects/fastqc)) and fastP (CHEN, S. et al. fastp: an ultra-fast all-in-one FASTQ preprocessor. Bioinformatics, v. 34, n. 17, p. i884–i890, 1 set. 2018).

## Mapping 🧬

BWA (LI, H.; DURBIN, R. Fast and accurate short read alignment with Burrows-Wheeler transform. Bioinformatics, [S. l.], v. 25, n. 14, p. 1754–1760, 2009. DOI: 10.1093/bioinformatics/btp324)

## Taxonomic Classification

[Kraken2](https://github.com/DerrickWood/kraken2/blob/master/docs/MANUAL.markdown) 🦑  </br>
[Kaiju](https://github.com/bioinformatics-centre/kaiju) 🦎 </br>
[Diamond](https://github.com/bbuchfink/diamond/wiki) 🔹</br>
[CLARK](http://clark.cs.ucr.edu/) 👓

## Assembly

[SPAdes](https://github.com/ablab/spades) ♠️

## Phylogenetic Tree 🌳

[ggTree](https://bioconductor.org/packages/release/bioc/html/ggtree.html) (RStudio)
