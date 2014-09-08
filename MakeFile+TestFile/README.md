Como usar
=========

Configuração
------------

1. No arquivo MakeFile, altere valor da variável SOUCER de "*.cpp" para o nome do seu arquivo a ser compilado.
2. Dê permissão de execução para o arquivo Testfile.sh.
3. Crie um arquivo os valores de entrada entrada e salve-o com .in no final do nome (uma "extensão").
4. Semelhante ao item 3, crie um arquivo com os valores correspondentes de saída em um arquivo com .out no final.

Execução
--------

* Entre com o comando <code>make</code> no diretório onde está o arquivo Makefile para compilar e executar o teste.
* Entre com o comando <code>make test</code> ou <code>./Testfile</code> para executar somente o teste (sem compilar o código).
* Entre com o comando <code>make clean test</code> para remover os arquivos gerados pelo teste.
* Entre com o comando <code>make clean</code> para remover todos os arquivos gerados pelo <code>make</code>.
