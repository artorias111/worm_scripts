#! /bin/bash
source deactivate
source activate blast_env

tblastn -db /projects/b1059/projects/Shriram/data/elegans/genomes/blast_db/elegdb -query /projects/b1059/projects/Shriram/data/briggsae/proteins/cb_mrt1.2.fa -out results.out -outfmt 6

source deactivate
