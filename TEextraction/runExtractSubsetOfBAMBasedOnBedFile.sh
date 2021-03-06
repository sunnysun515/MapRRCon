#!/bin/bash
#$ -S /bin/bash
module load java/1.8
module load jre/1.8
module load samtools
samjarpath=/ifs/data/proteomics/projects/Sunny/te_extraction/sam-1.89.jar
pathbam=$1
pathreg=$2
bamf=$3
reg=$4
threshmis=$5
echo "pathbam=$pathbam"
echo "pathreg=$pathreg"
echo "bamf=$bamf"
echo "reg=$reg"
echo "threshmis=$threshmis"
sortbampre=${bamf/%.bam/.sort}
samtools sort $pathbam/$bamf $pathbam/$sortbampre
if [ $? == 0 ]; then
	java -classpath sam-1.89.jar:. ExtractSubsetOfBAMBasedOnBedFile $pathbam $pathreg $sortbampre.bam $reg $threshmis
	if [ $? == 0 ]; then
		rm -rf $pathbam/$bamf
		rm -rf $pathbam/$sortbampre.bam
	else 
  	echo 'failed-run'
	fi
else 
  echo 'failed-run'
fi
