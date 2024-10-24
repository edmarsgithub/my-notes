Para instalar Python e SQLite no Ubuntu 24.04 via WSL, siga estas etapas:

### Instalação do Python e SQLite
1. **Abra o terminal no WSL** e execute os seguintes comandos para atualizar os pacotes:
   ```bash
   sudo apt update
   sudo apt upgrade
   ```

2. **Instale o Python**:
   ```bash
   sudo apt install python3
   ```

3. **Instale o SQLite** (embora o Python já tenha suporte nativo ao SQLite):
   ```bash
   sudo apt install sqlite3
   ```

### Código em Python para criar uma base de dados

Aqui está um exemplo simples de código Python usando a biblioteca `sqlite3` para criar uma base de dados com duas tabelas: `contatos` e `telefones`:

```python
import sqlite3

# Conectar ou criar o banco de dados
conn = sqlite3.connect('agenda.db')
cursor = conn.cursor()

# Criar tabela de contatos
cursor.execute('''
    CREATE TABLE IF NOT EXISTS contatos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
    )
''')

# Criar tabela de telefones (relacionada com contatos)
cursor.execute('''
    CREATE TABLE IF NOT EXISTS telefones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        contato_id INTEGER,
        telefone TEXT NOT NULL,
        FOREIGN KEY (contato_id) REFERENCES contatos(id)
    )
''')

# Inserir um contato e seus telefones
def inserir_contato(nome, telefones):
    cursor.execute('INSERT INTO contatos (nome) VALUES (?)', (nome,))
    contato_id = cursor.lastrowid
    for telefone in telefones:
        cursor.execute('INSERT INTO telefones (contato_id, telefone) VALUES (?, ?)', (contato_id, telefone))

# Exemplo de inserção de dados
inserir_contato('João Silva', ['123456789', '987654321'])
inserir_contato('Maria Oliveira', ['555444333'])

# Confirmar as mudanças
conn.commit()

# Fechar a conexão
conn.close()
```

### Explicação:
1. **`contatos`**: Tabela principal, com o `id` como chave primária.
2. **`telefones`**: Tabela relacionada, com o `contato_id` como chave estrangeira para a tabela `contatos`.

Esse código cria uma base de dados `agenda.db` e insere alguns contatos com múltiplos telefones.
