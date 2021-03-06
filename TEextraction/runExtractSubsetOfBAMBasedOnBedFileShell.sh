#!/bin/bash
# This script launches runExtractSubsetOfBAMBasedOnBedFile.sh for every pair of bam and region files
# Usage: runExtractSubsetOfBAMBasedOnBedFileShell.sh path-bam path_reg thresh-mismatch(3)
wd=`pwd`
pathbam=$1
pathreg=$2
threshmis=$3
reg=ucsc.rmsk.hg38.L1HS.bed
cd $pathbam
for i in *.bam; do qsub $wd/runExtractSubsetOfBAMBasedOnBedFile.sh $pathbam $pathreg $i $reg $threshmis; done
