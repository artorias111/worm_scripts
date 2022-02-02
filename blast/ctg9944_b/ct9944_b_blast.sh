#! /bin/bash
source deactivate
source activate blast_env

tblastn -db /projects/b1059/projects/Shriram/data/briggsae/genomes/blast_db/brigdb -query /projects/b1059/projects/Shriram/data/tropicalis/proteins/g9944.fa -out results.out -outfmt 6

source deactivate
