# Procura arquivo fonte C++ mais recente (ver parâmetro -nt)
SOURCE=`ls -nt | grep .cpp | sed 's/   / /g' | sed 's/  / /g' | cut -d' ' -f9 | head -n1`
EXE   ="a.app"
OBJECT="obj.o"

# Compilador
CC=g++

# Opções do compilador
CFLAGS=-c -Wall -std=c++11

# Teste
TESTFILE="testfile.sh"
TESTFOLDER="resultados"

# Regras
all: exe clean-objects test

exe: objects
	$(CC) $(OBJECT) -o $(EXE)

objects:
	$(CC) $(CFLAGS) $(SOURCE) -o $(OBJECT)

clean-objects:
	rm -rf *o

clean: clean-objects test-clean
	rm -f $(EXE)

test:
	./$(TESTFILE) $(EXE)

test-clean:
	rm -rf $(TESTFOLDER)
