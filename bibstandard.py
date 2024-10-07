import bibtexparser
from bibtexparser.bparser import BibTexParser
from bibtexparser.bwriter import BibTexWriter

def padronizar_campos(entry):
    # Mapeamento dos campos para o padrão desejado
    campo_mapping = {
        'author': 'author',
        'title': 'title',
        'journal': 'journal',
        'year': 'year',
        'doi': 'doi',
        # 'booktitle': 'booktitle',
        # 'volume': 'volume',
        # 'number': 'number',
        # 'pages': 'pages',
        # 'publisher': 'publisher',
        # 'address': 'address',
        # 'edition': 'edition',
        # 'isbn': 'isbn',
        # 'keywords': 'keywords'
    }

    # Criando um novo dicionário com os campos padronizados
    novo_entry = {campo_mapping[chave]: valor for chave, valor in entry.items() if chave in campo_mapping}
    
    return novo_entry

def padronizar_arquivo(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as f:
        parser = BibTexParser()
        bib_database = bibtexparser.load(f, parser=parser)
    
    # Padronizando cada entrada

    for entry in bib_database.entries:
        # if 'ENTRYTYPE' in entry:
            novo_entry = padronizar_campos(entry)
            print(entry)
            print(novo_entry)
            print()
            # entry.clear()  # Limpando a entrada original
            # entry.update(novo_entry)  # Atualizando com os campos padronizados
    print('type(bib_database.entries) =', type(bib_database.entries))

    with open(output_file, 'w', encoding='utf-8') as f:
        writer = BibTexWriter()
        f.write(writer.write(bib_database))

if __name__ == '__main__':
    input_file = 'arquivo_original.bib'
    output_file = 'arquivo_padronizado.bib'
    padronizar_arquivo(input_file, output_file)
    print(f'Arquivo padronizado salvo em {output_file}')
