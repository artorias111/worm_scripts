#! /bin/bash

source deactivate 
source activate blast_env
makeblastdb -in /projects/b1059/projects/Shriram/data/elegans/genomes/c_elegans.PRJNA13758.WS283.genomic.fa -out /projects/b1059/projects/Shriram/data/elegans/genomes/blast_db/elegdb -dbtype 'nucl' -hash_index

source deactivate
