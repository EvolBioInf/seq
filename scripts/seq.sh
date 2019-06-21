./testSeq ../data/test.fasta > tmp.out
DIFF=$(diff tmp.out ../data/seq.out)
if [ "$DIFF" == "" ] 
then
    printf "Test(seq)\tpass\n"
else
    printf "Test(seq)\tfail\n"
    echo ${DIFF}
fi

rm tmp.out
