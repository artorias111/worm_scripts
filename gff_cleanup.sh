grep "WormBase" c_elegans.PRJNA13758.WS283.annotations.gff3 | grep -v "WormBase_transposon" > N2.WBonly.WS283.gff3
grep "protein_coding" N2.WBonly.WS283.gff3 > N2.WBonly.WS283.protein_coding.txt
grep -o "=Gene.*" N2.WBonly.WS283.protein_coding.txt | sed 's/\;.*//' | sed 's/\=//' > N2.WBonly.WS283.gene_IDs.txt
grep "mRNA" N2.WBonly.WS283.gff3 > N2.WBonly.WS283.mRNA.txt
grep -wFf N2.WBonly.WS283.gene_IDs.txt N2.WBonly.WS283.mRNA.txt > N2.WBonly.WS283.protein_coding.mRNA.txt
grep -o "=Transcript.*" N2.WBonly.WS283.protein_coding.mRNA.txt | sed 's/\;.*//' | sed 's/\=//' | sed 's/^T/Parent=T/' > N2.WBonly.WS283.L3_parents.txt
grep -wFf N2.WBonly.WS283.L3_parents.txt N2.WBonly.WS283.gff3 > N2.WBonly.WS283.L3_features.txt
cat N2.WBonly.WS283.protein_coding.txt N2.WBonly.WS283.mRNA.txt N2.WBonly.WS283.L3_features.txt > N2.WBonly.WS283.PConly.gff3
#gffread -y N2.WBonly.WS283.PConly.prot.fa -g c_briggsae.PRJNA10731.WS283.genomic.fa N2.WBonly.WS283.PConly.gff3
