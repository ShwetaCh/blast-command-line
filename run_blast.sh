#!/bin/sh

DB=/mnt/scratch/schavan/Yale/yuparis_bacteria/db/nt
BLAST=../bin/ncbi-blast-2.13.0+/bin/blastn
THREADS=16

## New arguments added to handle short repetitive protein sequences
# -word_size 3 \
# -comp_based_stats F \
# -seg no \
# -evalue 100

echo "txt output"
## run with default blast output as TEXT
QUERY=../data/small.fasta
OUT=../out/top2-hits.html

$BLAST -query $QUERY \
    -db $DB \
    -out $OUT \
    -num_threads $THREADS \
    -max_target_seqs 2 \
    -max_hsps 1 \
    -evalue 1e-6 \
    -outfmt '7 qseqid sseqid length qlen slen qstart qend sstart send evalue stitle sstrand qseq sseq mismatch qcovs qcovhsp' \
    -html
    
    
    #nohup ./runBlastN.sh > nohup.out &
