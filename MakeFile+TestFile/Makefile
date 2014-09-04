# Coloque o nome do seu arquivo *.cpp em SOUCER
# edite EXE e OBJECT caso queira
SOUCER="jogo-cartas-war.cpp"
EXE   ="a.exe"
OBJECT="obj.o"

# Compilador
CC=g++

# Opções do compilador
CFLAGS=-c -Wall

# Teste
TESTFILE="Testfile.sh"
TESTFOLDER="test-folder"

# Regras
all: exe clean-objects test

exe: objects
	$(CC) $(OBJECT) -o $(EXE)

objects:
	$(CC) $(CFLAGS) $(SOUCER) -o $(OBJECT)

clean-objects:
	rm -rf *o

clean: clean-objects test-clean
	rm $(EXE)

test:
	./$(TESTFILE) $(EXE)

test-clean:
	rm -rf $(TESTFOLDER)
