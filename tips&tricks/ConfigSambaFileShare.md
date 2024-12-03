Segue um tutorial completo e detalhado para instalar e configurar o Samba, compartilhando a pasta `/media/samba` para o usuário `edmars`, com leitura, escrita e execução.

---

### 1. **Instalar o Samba**

1. Atualize os pacotes do sistema:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
   - **Explicação**: Atualiza a lista de pacotes e aplica atualizações para garantir a instalação de softwares mais recentes e estáveis.

2. Instale o Samba:
   ```bash
   sudo apt install samba -y
   ```
   - **Explicação**: Instala o pacote Samba, que permite configurar compartilhamentos no Linux acessíveis via SMB/CIFS.

---

### 2. **Criar e Configurar a Pasta Compartilhada**

1. Crie a pasta `/media/samba`:
   ```bash
   sudo mkdir -p /media/samba
   ```
   - **Explicação**: Cria a pasta que será compartilhada. A opção `-p` cria diretórios intermediários caso não existam.

2. Defina o proprietário da pasta como o usuário `edmars`:
   ```bash
   sudo chown edmars:edmars /media/samba
   ```
   - **Explicação**: Define `edmars` como proprietário da pasta e do grupo. Assim, o usuário terá controle total.

3. Configure as permissões de acesso:
   ```bash
   sudo chmod 770 /media/samba
   ```
   - **Explicação**: Permite leitura, escrita e execução para o proprietário e grupo, e nenhum acesso para outros usuários.

---

### 3. **Configurar o Samba**

1. Faça um backup do arquivo de configuração padrão:
   ```bash
   sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
   ```
   - **Explicação**: Cria uma cópia de segurança do arquivo de configuração do Samba antes de fazer alterações.

2. Edite o arquivo de configuração:
   ```bash
   sudo nano /etc/samba/smb.conf
   ```
   - **Explicação**: Abre o editor `nano` para editar o arquivo de configuração do Samba.

3. Adicione a configuração do compartilhamento ao final do arquivo:
   ```ini
   [samba_share]
   path = /media/samba
   valid users = edmars
   read only = no
   browsable = yes
   create mask = 0660
   directory mask = 0770
   ```
   - **Explicação**:
     - `[samba_share]`: Nome do compartilhamento visível na rede.
     - `path = /media/samba`: Especifica o caminho físico da pasta compartilhada.
     - `valid users = edmars`: Restringe o acesso ao usuário `edmars`.
     - `read only = no`: Permite escrita na pasta.
     - `browsable = yes`: Torna o compartilhamento visível na rede.
     - `create mask` e `directory mask`: Define permissões padrão para arquivos e diretórios criados.

---

### 4. **Adicionar o Usuário ao Samba**

1. Adicione o usuário `edmars` ao Samba:
   ```bash
   sudo smbpasswd -a edmars
   ```
   - **Explicação**: Cria um usuário no Samba com as credenciais de `edmars`.

2. Ative o usuário no Samba:
   ```bash
   sudo smbpasswd -e edmars
   ```
   - **Explicação**: Habilita o usuário no Samba para que possa autenticar no compartilhamento.

---

### 5. **Reiniciar e Testar o Samba**

1. Reinicie o serviço Samba:
   ```bash
   sudo systemctl restart smbd
   ```
   - **Explicação**: Reinicia o serviço para aplicar as novas configurações.

2. Verifique o status do serviço:
   ```bash
   sudo systemctl status smbd
   ```
   - **Explicação**: Confirma que o serviço Samba está em execução.

3. Teste a configuração:
   ```bash
   testparm
   ```
   - **Explicação**: Verifica o arquivo de configuração do Samba para erros.

---

### 6. **Acesso ao Compartilhamento**

1. No Windows:
   - Pressione `Win + R`, digite `\\<IP_DO_SERVIDOR>\samba_share` e pressione Enter.
   - Use as credenciais de `edmars` ao ser solicitado.

2. No Linux:
   - Acesse via gerenciador de arquivos com `smb://<IP_DO_SERVIDOR>/samba_share`.
   - Digite as credenciais de `edmars`.

---

### Resumo dos Comandos e Propagação

| Comando                         | Propagação/Impacto                                                                                       |
|---------------------------------|----------------------------------------------------------------------------------------------------------|
| `apt update && apt upgrade`     | Atualiza o sistema para versões mais recentes.                                                          |
| `apt install samba`             | Instala o Samba para habilitar compartilhamento via SMB/CIFS.                                           |
| `mkdir`                         | Cria a pasta compartilhada.                                                                             |
| `chown`                         | Define `edmars` como dono, permitindo controle total sobre a pasta.                                     |
| `chmod`                         | Configura permissões (leitura, escrita e execução) para o usuário e nenhum acesso para outros.          |
| `nano`                          | Edita o arquivo de configuração do Samba para personalizar o compartilhamento.                         |
| `smbpasswd`                     | Adiciona e habilita o usuário para autenticação no Samba.                                               |
| `systemctl restart smbd`        | Reinicia o serviço para carregar as novas configurações.                                                |
| `testparm`                      | Valida a configuração do Samba, evitando erros de sintaxe ou conflito.                                 |

---


