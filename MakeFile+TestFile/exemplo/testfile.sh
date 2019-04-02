#!/bin/sh

if [ $# -lt '1' ]; then
	echo "Erro, requer nome do executável como parâmetro."
	echo "Use: ./testfile.sh 'nome do programa'"
	echo "Requer ainda, no diretório atual, um arquivo de entrada com final '.in' e um arquivo com final '.out' com os resultados esperados para comparaçao."
	exit
fi

# Definições das variáveis
EXE="./"$1
## Pega arquivo com extensão .in mais recente
ENTRY=$(ls -nt | grep .in | sed 's/   / /g' | sed 's/  / /g' | cut -d' ' -f9 | head -n1)
## Pega arquivo com extensão .out mais recente
OUT=$(ls -nt | grep .out | sed 's/   / /g' | sed 's/  / /g' | cut -d' ' -f9 | head -n1)
TESTFOLDER="resultados"
OUTRESULT=$TESTFOLDER"/saida.out"
OUTDIFF=$TESTFOLDER"/diff.out"
# Fim das definições das variáveis

if [ ! -s $ENTRY ]; then
	echo "Erro, arquivo de entrada de teste não encontrado."
	echo "  Crie um arquivo de entrada de teste com extensão '.in'."
	exit
fi
if [ ! -s $OUT ]; then
	echo "Erro, arquivo de saída de teste não encontrado."
	echo "  Crie arquivo com resultados esperados para comparação com extensão '.in'."
	exit
fi

rm -rf $TESTFOLDER
mkdir $TESTFOLDER

if [ -s $EXE ]; then
	$EXE < $ENTRY > $OUTRESULT
	diff $OUTRESULT $OUT > $OUTDIFF
	if [ -s $OUTDIFF ]; then
		echo "Teste erro, diferenças encontradas."
		cat $OUTDIFF
	else
		echo "Teste OK, saída conforme esperada."
	fi
else
	echo "Erro, executável não encontrado."
	echo "  Nome do programa passado como parâmetro: '"$1"', não foi encontrado."
	
fi
