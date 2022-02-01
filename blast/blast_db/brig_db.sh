#! /bin/bash

source deactivate 
source activate blast_env
makeblastdb -in /projects/b1059/projects/Shriram/data/briggsae/genomes/c_briggsae.PRJNA10731.WS283.genomic.fa -out /projects/b1059/projects/Shriram/data/briggsae/genomes/blast_db/brigdb -dbtype 'nucl' -hash_index

source deactivate
