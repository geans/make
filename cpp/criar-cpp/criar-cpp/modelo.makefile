# Nomes utilizados
FONTE=substituir
EXE   =$(FONTE).app
OBJETO=$(FONTE).o

# Compilador
CC=g++

# Extenção
X=cpp

# Opções do compilador
CFLAGS=-c -Wall -std=c++11

## Regras
all: exe limpa-objeto teste

exe: objeto
	$(CC) $(OBJETO) -o $(EXE)

objeto:
	$(CC) $(CFLAGS) $(FONTE).$(X) -o $(OBJETO)

limpa-objeto:
	rm -rf *.o

limpa: limpa-objeto
	rm -f $(EXE)

teste:
	./$(EXE) < $(FONTE).in
