### Tutorial: Personalizando o Prompt e as Cores no Bash

Neste tutorial, vamos configurar cores customizadas para o prompt do Bash e para o comando `ls`, aplicando configurações específicas para o **usuário root** e para outros usuários. Para diferenciar, as configurações do **root** serão colocadas no arquivo `/etc/bash.bashrc`, enquanto as dos outros usuários estarão em seus respectivos arquivos `~/.bashrc`.

---

### **1. Sobre o `LS_COLORS`**
O `LS_COLORS` define cores para os tipos de arquivos listados pelo comando `ls`. No exemplo abaixo:

```bash
ORIGINAL=$LS_COLORS
LS_COLORS="ex=1;94:di=1;32"
```

- `ex=1;94`: Define **executáveis** com estilo **negrito** e cor **azul claro**.
- `di=1;32`: Define **diretórios** com estilo **negrito** e cor **verde**.

Armazenamos a configuração original em `ORIGINAL` para restaurar as cores padrão, se necessário.

---

### **2. Sobre o `PS1` (Prompt do Shell)**
O `PS1` define o layout e as cores do prompt no terminal.  
- Para o **root**:
  ```bash
  PS1="\[\e[38;5;33m\]\u\[\e[38;5;8m\]@\[\e[38;5;7m\]\h:\[\e[38;5;33m\]\w\[\033[0m\]$ \[\033[0m\]"
  ```
  Este prompt mostra:
  - Usuário em **azul claro**.
  - Hostname em cinza.
  - Diretório atual em azul claro.

- Para **outros usuários**:
  ```bash
  PS1='\n\[\033[1;93m\]\u\[\033[1;31m\]@\[\033[1;93m\]\h:\[\033[1;32m\]\w\[\033[1;31m\]\$\[\033[0m\] '
  ```
  Este prompt mostra:
  - Usuário em **amarelo**.
  - Hostname em vermelho.
  - Diretório atual em verde.

---

### **3. Configurando para o Root**
1. Edite o arquivo `/etc/bash.bashrc`:
   ```bash
   sudo nano /etc/bash.bashrc
   ```

2. Adicione ao final do arquivo:
   ```bash
   # Salvar configuração original do LS_COLORS
   ORIGINAL=$LS_COLORS

   # Configuração de cores personalizadas para o ls
   LS_COLORS="ex=1;94:di=1;32"

   # Prompt personalizado para o root
   PS1="\[\e[38;5;33m\]\u\[\e[38;5;8m\]@\[\e[38;5;7m\]\h:\[\e[38;5;33m\]\w\[\033[0m\]$ \[\033[0m\]"
   ```

3. Salve e saia (`CTRL+O`, `ENTER`, depois `CTRL+X`).

4. Para aplicar as mudanças imediatamente:
   ```bash
   source /etc/bash.bashrc
   ```

---

### **4. Configurando para Outros Usuários**
1. Edite o arquivo `~/.bashrc` do usuário:
   ```bash
   nano ~/.bashrc
   ```

2. Adicione ao final do arquivo:
   ```bash
   # Salvar configuração original do LS_COLORS
   ORIGINAL=$LS_COLORS

   # Configuração de cores personalizadas para o ls
   LS_COLORS="ex=1;94:di=1;32"

   # Prompt personalizado para outros usuários
   PS1='\n\[\033[1;93m\]\u\[\033[1;31m\]@\[\033[1;93m\]\h:\[\033[1;32m\]\w\[\033[1;31m\]\$\[\033[0m\] '
   ```

3. Salve e saia (`CTRL+O`, `ENTER`, depois `CTRL+X`).

4. Aplique as mudanças:
   ```bash
   source ~/.bashrc
   ```

---

### **5. Testando as Configurações**
- Abra um terminal:
  - Logue como root para verificar o prompt e as cores específicas do root.
  - Logue como outro usuário para verificar o prompt e as cores personalizadas para usuários comuns.

- Teste o comando `ls` para visualizar as cores de diretórios e executáveis.

---

### **6. Referência para Customização de Cores**
Se quiser criar prompts personalizados com outras cores e estilos, use o gerador de prompts disponível no link:
[https://robotmoon.com/bash-prompt-generator/](https://robotmoon.com/bash-prompt-generator/)

---

### **7. Restaurando Configurações Originais**
Se quiser voltar às cores padrão, basta redefinir o valor do `LS_COLORS` para o original:
```bash
LS_COLORS=$ORIGINAL
export LS_COLORS
```

---

### **Conclusão**
