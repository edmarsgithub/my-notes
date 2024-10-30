Configurar a política de qualidade de senha no Ubuntu, exigindo uma senha com um mínimo de 6 caracteres, contendo pelo menos 4 letras (uma obrigatoriamente maiúscula), um dígito e um símbolo especial.

---

# Tutorial: Configuração de Política de Qualidade de Senha no Ubuntu

Este tutorial irá guiá-lo na configuração de qualidade de senha no Ubuntu para atender aos seguintes critérios:
- Senha com mínimo de **6 caracteres**.
- Pelo menos **4 letras** (uma letra deve ser maiúscula).
- Pelo menos **1 dígito**.
- Pelo menos **1 símbolo especial**.

### Passo 1: Instalar o pacote `libpam-pwquality`
No Ubuntu, o módulo `libpam-pwquality` permite configurar a política de senha. Primeiro, vamos garantir que ele esteja instalado:

```bash
sudo apt update
sudo apt install libpam-pwquality
```

### Passo 2: Configurar o arquivo `pwquality.conf`

Após a instalação, configure os parâmetros de política de senha no arquivo `/etc/security/pwquality.conf`.

1. Abra o arquivo `pwquality.conf` com um editor de texto, por exemplo:

    ```bash
    sudo nano /etc/security/pwquality.conf
    ```

2. Adicione ou edite os seguintes parâmetros para configurar a política de senha conforme necessário:

    ```plaintext
    # Número mínimo de caracteres na senha
    minlen = 6

    # Número mínimo de caracteres de cada tipo de classe exigidos na senha:
    minclass = 4               # Classes: letras maiúsculas, minúsculas, dígitos, símbolos

    # Número mínimo de letras
    lcredit = -3               # Pelo menos 3 letras (um valor negativo obriga o número)

    # Pelo menos uma letra maiúscula é obrigatória
    ucredit = -1               # Exige uma letra maiúscula

    # Número mínimo de dígitos
    dcredit = -1               # Exige pelo menos um dígito

    # Número mínimo de símbolos especiais
    ocredit = -1               # Exige pelo menos um símbolo especial
    ```

3. Salve o arquivo e feche o editor (no nano, use `Ctrl + O` para salvar e `Ctrl + X` para sair).

### Passo 3: Configurar o PAM (Pluggable Authentication Module)

A configuração do `libpam-pwquality` precisa ser ativada nos arquivos de configuração do PAM. Para isso, verifique o arquivo `/etc/pam.d/common-password`.

1. Abra o arquivo `common-password` com um editor de texto:

    ```bash
    sudo nano /etc/pam.d/common-password
    ```

2. Encontre a linha que contém `pam_pwquality.so` e certifique-se de que esteja semelhante a esta:

    ```plaintext
    password requisite pam_pwquality.so retry=3
    ```

    - **`retry=3`** define o número de tentativas que o usuário tem para inserir uma senha que atenda aos critérios de qualidade antes que o sistema rejeite a criação da senha.

3. Salve o arquivo e feche o editor.

### Passo 4: Testar a Política de Senha

Agora, você pode testar as novas políticas criando um usuário de teste ou alterando a senha de um usuário existente:

```bash
sudo passwd nome_do_usuario
```

Tente inserir uma senha que não atenda aos critérios (por exemplo, sem dígitos ou sem letras maiúsculas), e o sistema deve rejeitá-la.

### Exemplos de Senhas que Atendem aos Critérios

- **Corretas**:
  - `A1b@cd`
  - `Hello2!`

- **Incorretas**:
  - `abcd1@` (faltam letras maiúsculas)
  - `Abcdef` (faltam dígitos e símbolos)

---

Com isso, a política de senha configurada garantirá que todas as senhas no sistema Ubuntu atendam aos critérios de segurança especificados.
