Aqui está o tutorial para instalar e configurar o Samba no Ubuntu, permitindo compartilhar a pasta `/mnt/samba/` para acesso em redes Windows, sem exigir login.

---

# Tutorial: Instalação e Configuração do Samba para Compartilhamento de Pasta no Ubuntu

Este tutorial mostra como configurar o Samba para compartilhar a pasta `/mnt/samba/` e permitir o acesso sem login, para que dispositivos Windows possam acessar essa pasta em uma rede local.

### Requisitos

- Um sistema Ubuntu com acesso sudo.
- A pasta `/mnt/samba/` já criada. Se ainda não existir, você pode criá-la durante o tutorial.

### Passo 1: Instalar o Samba

O Samba permite compartilhamento de arquivos entre sistemas Linux e Windows. Vamos instalá-lo com o comando:

```bash
sudo apt update
sudo apt install samba -y
```

### Passo 2: Criar o Diretório para Compartilhamento

Se a pasta `/mnt/samba/` ainda não existir, crie-a com o seguinte comando:

```bash
sudo mkdir -p /mnt/samba/
```

Para permitir o acesso sem login, dê permissões de leitura e gravação para todos os usuários:

```bash
sudo chmod 777 /mnt/samba/
```

> **Nota**: Permitir permissões totais (`777`) pode ser inseguro para alguns ambientes. Certifique-se de que este compartilhamento seja configurado apenas em redes confiáveis.

### Passo 3: Configurar o Samba

Agora vamos configurar o arquivo de configuração do Samba para habilitar o compartilhamento.

1. Abra o arquivo de configuração do Samba:

    ```bash
    sudo nano /etc/samba/smb.conf
    ```

2. Role até o final do arquivo e adicione a seguinte configuração para compartilhar a pasta `/mnt/samba/`:

    ```plaintext
    [PublicShare]
    path = /mnt/samba/
    browseable = yes
    writable = yes
    guest ok = yes
    create mask = 0777
    directory mask = 0777
    force user = nobody
    ```

    Explicação dos parâmetros:
    - **`[PublicShare]`**: Nome do compartilhamento. É o nome que aparecerá na rede.
    - **`path`**: Caminho da pasta compartilhada.
    - **`browseable`**: Define se o compartilhamento é visível para usuários da rede.
    - **`writable`**: Permite que usuários façam alterações no conteúdo.
    - **`guest ok`**: Permite o acesso como convidado, sem a necessidade de autenticação.
    - **`create mask` e `directory mask`**: Definem as permissões de arquivos e diretórios criados na pasta.
    - **`force user`**: Garante que todas as operações sejam feitas como o usuário `nobody`, permitindo acesso mais seguro para convidados.

3. Salve e feche o arquivo (`Ctrl + O` para salvar e `Ctrl + X` para sair no Nano).

### Passo 4: Reiniciar o Serviço Samba

Após a configuração, reinicie o serviço do Samba para aplicar as mudanças:

```bash
sudo systemctl restart smbd
```

Verifique se o Samba está ativo e rodando:

```bash
sudo systemctl status smbd
```

### Passo 5: Permitir o Samba no Firewall (Opcional)

Se o seu firewall UFW (Uncomplicated Firewall) estiver ativo, permita o tráfego do Samba para que ele possa ser acessado pela rede:

```bash
sudo ufw allow samba
```

### Passo 6: Testar o Compartilhamento

Agora, você pode testar o acesso ao compartilhamento em um dispositivo Windows:

1. Abra o **Explorador de Arquivos** no Windows.
2. Na barra de endereço, digite o endereço IP do Ubuntu seguido pelo nome do compartilhamento, como:

    ```plaintext
    \\IP_DO_UBUNTU\PublicShare
    ```

    Substitua `IP_DO_UBUNTU` pelo endereço IP do seu Ubuntu. Você pode descobrir o IP com o comando:

    ```bash
    hostname -I
    ```

3. Pressione **Enter**. A pasta `/mnt/samba/` deve estar acessível sem a necessidade de login.

---

### Resumo dos Comandos

1. **Instalar o Samba**:
    ```bash
    sudo apt update
    sudo apt install samba -y
    ```

2. **Criar e configurar permissões da pasta**:
    ```bash
    sudo mkdir -p /mnt/samba/
    sudo chmod 777 /mnt/samba/
    ```

3. **Configurar o Samba**:
    - Editar `/etc/samba/smb.conf` e adicionar a seção de compartilhamento.

4. **Reiniciar o Samba**:
    ```bash
    sudo systemctl restart smbd
    ```

5. **Permitir o Samba no Firewall (opcional)**:
    ```bash
    sudo ufw allow samba
    ```

Com essas configurações, o Samba estará configurado para compartilhar a pasta `/mnt/samba/` para acesso em redes Windows, sem exigir autenticação.
