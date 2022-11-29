Como usar
=========

Configuração
------------

1. O arquivo MakeFile irá considerar o arquivo com final '.cpp' mais recentemente modificado do diretório para compilação e execução.
2. Dê permissão de execução para o arquivo Testfile.sh.
3. Crie um arquivo os valores de entrada entrada e salve-o com .in no final do nome.
4. Crie um arquivo com os valores esperados para a saída em um arquivo com .out no final.

Execução
--------

* Entre com o comando <code>make</code> no diretório onde está o arquivo Makefile para compilar e executar o teste. Um aviso indicará se houve divergencia entre o resultado obtido e o resultado esperado. Será criado um diretório com nome 'resultados' que conterá o resultado a saída do programa (saida.out) e o resultado da comparação (diff.out).
* Entre com o comando <code>make test</code> ou <code>./Testfile</code> para executar somente o teste (sem compilar o código).
* Entre com o comando <code>make clean test</code> para remover o diretório e os arquivos gerados pelo teste.
* Entre com o comando <code>make clean</code> para remover todos os arquivos gerados pelo <code>make</code>.
