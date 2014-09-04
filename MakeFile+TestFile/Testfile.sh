#!/bin/sh

if [ ! -s $1 ]; then
	echo "Erro, requer nome do executável como parâmetro"
	exit
else
	echo "Nome do executável passado: "$1
fi

echo *.in > pattern.in
echo *.out > pattern.out

EXE="./"$1
ENTRY=$(cat pattern.in)
OUT=$(cat pattern.out)
TESTFOLDER="test-folder"
OUTRESULT=$TESTFOLDER"/test.out"
OUTDIFF=$TESTFOLDER"/diff.out"

rm pattern.in pattern.out

if [ ! -s $ENTRY ]; then
	echo "Erro, arquivo de entrada de teste não existe"
	exit
fi
if [ ! -s $OUT ]; then
	echo "Erro, arquivo de saída de teste não existe"
	exit
fi

rm -rf $TESTFOLDER
mkdir $TESTFOLDER

if [ -s $EXE ]; then
	$EXE < $ENTRY > $OUTRESULT
	diff $OUTRESULT $OUT > $OUTDIFF
	if [ -s $OUTDIFF ]; then
		echo "Teste 1: erro, encontrado diferenças"
		cat $OUTDIFF
	else
		echo "Teste 1: OK, saída conforme esperada"
	fi
else
	echo "Erro, executável não encontrado"
fi